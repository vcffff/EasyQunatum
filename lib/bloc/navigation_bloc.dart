import 'package:easyquantum/bloc/navigation_event.dart';
import 'package:easyquantum/bloc/navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(Navigatehome()) {
    on<NavigatetoDetail>((event, emit) {
      emit(NavigationDetail(event.index));
    });
    on<NavigateBack>((event, emit) {
      emit(Navigatehome());
    });
  }
}
