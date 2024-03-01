part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent {}

class ChatInitialEvent extends ChatEvent{
  final ProfileModel profile;
  ChatInitialEvent({required this.profile});
}
class LoadPreviousChatsEvent extends ChatEvent {}
class SendMessageEvent extends ChatEvent {}
class NavigateToConversationsPageEvent extends ChatEvent{}
