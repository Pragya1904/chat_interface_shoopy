import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:chat_app/core/models/ProfileModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'conversation_event.dart';
part 'conversation_state.dart';

class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  ConversationBloc() : super(ConversationInitialState()) {
    on<ConversationInitialEvent>(conversationInitialEvent);
    on<LoadConversationsEvent>(loadConversationsEvent);
    on<NavigateToChatDetailEvent>(navigateToChatDetailEvent);
  }

  Future<void> conversationInitialEvent(ConversationInitialEvent event, Emitter<ConversationState> emit) async {
    final CollectionReference _collectionReference = FirebaseFirestore.instance.collection('users');
    emit(ConversationLoadingState());

    try {
      final QuerySnapshot conversations = await _collectionReference.get();
      final List<ProfileModel> profiles = conversations.docs.map((doc) => ProfileModel.fromJson(doc.data() as Map<String, dynamic>)).toList();

      emit(ConversationLoadedState(profiles: profiles));
    } catch (e) {
      emit(ConversationErrorState());
    }
  }


  FutureOr<void> loadConversationsEvent(LoadConversationsEvent event, Emitter<ConversationState> emit) {
  }

  FutureOr<void> navigateToChatDetailEvent(NavigateToChatDetailEvent event, Emitter<ConversationState> emit) {
    emit(ConversationNavigateToChatDetailActionState(profile: event.profile));
  }
}
