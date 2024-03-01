part of 'conversation_bloc.dart';

@immutable
abstract class ConversationState {}

abstract class ConversationActionState extends ConversationState {}

class ConversationInitialState extends ConversationState {}

class ConversationLoadingState extends ConversationState {}

class ConversationLoadedState extends ConversationState {
  final List<ProfileModel> profiles;

  ConversationLoadedState({required this.profiles});
}

class ConversationErrorState extends ConversationState {}

class ConversationNavigateToChatDetailActionState extends ConversationActionState {
  final ProfileModel profile;
  ConversationNavigateToChatDetailActionState({required this.profile});
}
