import 'package:equatable/equatable.dart';

class CounterEvents extends Equatable {
  const CounterEvents();

  @override
  List<Object?> get props => [];
}

class CounterIncremented extends CounterEvents {}

class CounterDecremented extends CounterEvents {}
