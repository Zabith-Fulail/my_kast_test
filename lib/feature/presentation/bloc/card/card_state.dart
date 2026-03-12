part of 'card_bloc.dart';

abstract class CardState {}

final class CardInitial extends CardState {}

class AddCardSuccessState extends CardState {
  final List<CardData> cards;

  AddCardSuccessState({required this.cards});
}

class AddCardLoadingState extends CardState {}

class AddCardFailedState extends CardState {
  final String? error;

  AddCardFailedState({this.error});
}
