part of 'card_bloc.dart';

abstract class CardEvent {}

class AddCardEvent extends CardEvent{
  final CardData card;

  AddCardEvent({required this.card});
}