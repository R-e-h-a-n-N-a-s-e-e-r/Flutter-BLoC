import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_practice/BLoC/Counter/counter_events.dart';
import 'package:flutter_bloc_practice/BLoC/Counter/counter_states.dart';

class CounterBloc extends Bloc<CounterEvents, CounterStates> {
  CounterBloc() : super(CounterStates()) {
    on<CounterIncremented>(_increment);
    on<CounterDecremented>(_decrement);
  }

  void _increment(CounterIncremented event, Emitter<CounterStates> emit) {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void _decrement(CounterDecremented event, Emitter<CounterStates> emit) {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
