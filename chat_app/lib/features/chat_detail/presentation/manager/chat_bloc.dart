import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_app/core/models/ProfileModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../../core/models/ChatRoomModel.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitialState()) {
   on<ChatInitialEvent>(chatInitialEvent);
   on<SendMessageEvent>(sendMessageEvent);
   on<LoadPreviousChatsEvent>(loadPreviousChatsEvent);
   on<NavigateToConversationsPageEvent>(navigateToConversationsPageEvent);
  }

  FutureOr<void> chatInitialEvent(ChatInitialEvent event, Emitter<ChatState> emit) async{
    emit(ChatLoadingState());
    try{
      //do something to fetch the data
      emit(ChatLoadedSuccessfullyState());
    }
    catch (e){
      emit(ChatErrorState());
    }
  }

  FutureOr<void> sendMessageEvent(SendMessageEvent event, Emitter<ChatState> emit) {
  }

  FutureOr<void> loadPreviousChatsEvent(LoadPreviousChatsEvent event, Emitter<ChatState> emit) {
  }

  FutureOr<void> navigateToConversationsPageEvent(NavigateToConversationsPageEvent event, Emitter<ChatState> emit) {
  }
}
