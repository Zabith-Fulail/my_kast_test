part of 'counter_bloc.dart';

abstract class CounterEvent {}

class NumberIncrementEvent extends CounterEvent {
  final int number;
  final bool isIncrement;

  NumberIncrementEvent({required this.number, required this.isIncrement});
}

class ToggleEvent extends CounterEvent {
  final bool isOn;

  ToggleEvent({required this.isOn});
}
