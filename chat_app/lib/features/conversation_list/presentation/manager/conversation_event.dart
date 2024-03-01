part of 'conversation_bloc.dart';

@immutable
abstract class ConversationEvent {}

class ConversationInitialEvent extends ConversationEvent{}
class LoadConversationsEvent extends ConversationEvent {}
class NavigateToChatDetailEvent extends ConversationEvent {
  final ProfileModel profile;
  NavigateToChatDetailEvent({required this.profile});
}
