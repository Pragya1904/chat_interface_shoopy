part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}

class HomeProfileBtnNavigateEvent extends HomeEvent{
  HomeProfileBtnNavigateEvent();
}
