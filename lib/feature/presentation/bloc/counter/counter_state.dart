part of 'counter_bloc.dart';

abstract class CounterState {}

final class CounterInitial extends CounterState {}

class CounterSuccessState extends CounterState {
  final int number;

  CounterSuccessState({required this.number});
}
