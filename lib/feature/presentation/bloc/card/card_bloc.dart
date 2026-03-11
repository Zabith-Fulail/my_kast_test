import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../views/home_view/data/card_data.dart';

part 'card_event.dart';

part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  List<CardData> cards = [];
  CardBloc() : super(CardInitial()) {
    on<AddCardEvent>(_addCard);
  }

  Future<void> _addCard(AddCardEvent event, Emitter<CardState> emit) async {

    emit(AddCardLoadingState());
    try{
      cards.add(event.card);
      return emit(AddCardSuccessState(cards: List.from(cards)));
    }
    catch(e){
      emit(AddCardFailedState(
        error: e.toString()
      ));
    }
  }
}
