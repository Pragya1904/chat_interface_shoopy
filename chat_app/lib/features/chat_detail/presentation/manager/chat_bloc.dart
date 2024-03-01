import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_app/core/models/ProfileModel.dart';
import 'package:chat_app/features/chat_detail/data/repositories/FirebaseChatDataRepository.dart';
import 'package:chat_app/features/chat_detail/data/repositories/LoadChatsRepository.dart';
import 'package:chat_app/features/chat_detail/data/repositories/SendMessageRepository.dart';
import 'package:chat_app/features/conversation_list/presentation/manager/conversation_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/models/ChatRoomModel.dart';
import '../../data/models/MessageModel.dart';


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
    FirebaseChatDataRepository chatDataRepository=FirebaseChatDataRepository();
    LoadChatsRepository loadChatsRepository=LoadChatsRepository(chatroomId: event.profile.uid); //using profile uid as a temporary fix because rn profile uid is equal to chatroom id ==> not a good practice!!
    emit(ChatLoadingState());
    try{
      await chatDataRepository.getOrCreateChatRoom(event.profile); //to create chatroom
      final messages=await loadChatsRepository.LoadChats();     //to load msgs
      emit(ChatLoadedSuccessfullyState(messages));
    }
    catch (e){
      emit(ChatErrorState());
    }
  }

  FutureOr<void> sendMessageEvent(SendMessageEvent event, Emitter<ChatState> emit)async {
    SendMessageRepository sendMessageRepository=SendMessageRepository(chatroomId: event.chatroomId,msg: event.message);
    LoadChatsRepository loadChatsRepository=LoadChatsRepository(chatroomId: event.chatroomId);
    try{
      sendMessageRepository.SendMessage();
      final messages=await loadChatsRepository.LoadChats();     //to load msgs
      emit(ChatLoadedSuccessfullyState(messages));

    }
    catch(e){
      emit(SentMessageErrorState());
    }
  }

  FutureOr<void> loadPreviousChatsEvent(LoadPreviousChatsEvent event, Emitter<ChatState> emit) {
  }

  FutureOr<void> navigateToConversationsPageEvent(NavigateToConversationsPageEvent event, Emitter<ChatState> emit) {
    emit(NavigateToConversationListPageActionState());
  }
}
