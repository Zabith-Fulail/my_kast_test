import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<NumberIncrementEvent>(_increment);
    on<ToggleEvent>(toggleButton);
  }

  void _increment(NumberIncrementEvent event, Emitter<CounterState> emit) {
    late int number;
    if (event.isIncrement) {
      number = event.number + 1;
    } else {
      number = event.number - 1;
    }
    emit(CounterSuccessState(number: number));
  }

  void toggleButton(ToggleEvent event, Emitter<CounterState> emit){
    emit(ToggleSuccessState(isOn: event.isOn));
  }
}
