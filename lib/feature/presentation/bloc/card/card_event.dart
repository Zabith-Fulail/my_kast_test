part of 'card_bloc.dart';

@immutable
sealed class CardEvent {}

class AddCardEvent extends CardEvent{
  final CardData card;

  AddCardEvent({required this.card});
}