part of 'chat_bloc.dart';

@immutable
abstract class ChatState {}

abstract class ChatActionState {}

class ChatInitialState extends ChatState {}

class ChatLoadingState extends ChatState {}

class ChatLoadedSuccessfullyState extends ChatState {}

class ChatErrorState extends ChatState {}

class SendMessageSuccessState extends ChatActionState {}

class SendMessageErrorState extends ChatActionState {}

class NavigateToConversationListPageActionState extends ChatActionState{}
// class LoadEarlierMessagesSuccessState extends ChatActionState {}
//
// class LoadEarlierMessagesErrorState extends ChatActionState {}

