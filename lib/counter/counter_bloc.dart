import 'package:bloc_counter/counter/counter_event.dart';
import 'package:bloc_counter/counter/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0, false)) {
    on<IncrementEvent>((event, emit) {
      emit(CounterState(state.count + 1, true));
    });
    on<DecrementEvent>((event, emit) {
      emit(CounterState(state.count - 1, true));
    });

    on<ResetEvent>((event, emit) {
      emit(CounterState(0, false));
    });
  }
}
