import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProfileBtnNavigateEvent>(homeProfileBtnNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) {
    emit(HomeLoadingState());
    emit(HomeLoadedSuccessState());
  }

  FutureOr<void> homeProfileBtnNavigateEvent(HomeProfileBtnNavigateEvent event, Emitter<HomeState> emit) {
    print("navigate to profile page");
    emit(HomeNavigatetoProfilePageActionState());
  }
}
