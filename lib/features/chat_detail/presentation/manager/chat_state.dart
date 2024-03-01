part of 'chat_bloc.dart';

@immutable
abstract class ChatState {}

abstract class ChatActionState extends ChatState{}

class ChatInitialState extends ChatState {}

class ChatLoadingState extends ChatState {}

class ChatLoadedSuccessfullyState extends ChatState {
  final List<MessageModel> messages;
  ChatLoadedSuccessfullyState(this.messages);
}

class ChatErrorState extends ChatState {}

class SendMessageSuccessState extends ChatActionState {}

class SentMessageErrorState extends ChatActionState{}

class NavigateToConversationListPageActionState extends ChatActionState{}

