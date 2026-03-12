import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kast_test/feature/presentation/bloc/counter/counter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final CounterBloc _bloc = CounterBloc();
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "01",
            child: Icon(Icons.plus_one),
              onPressed: (){
            _bloc.add(NumberIncrementEvent(number: number,isIncrement: true));
          }),
          FloatingActionButton(
            heroTag: "02",
              child: Icon(Icons.minimize),
              onPressed: (){
            _bloc.add(NumberIncrementEvent(number: number,isIncrement: false));
          }),
        ],
      ),
      body: Center(
        child: BlocProvider(
          create: (context) => _bloc,
          child: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              if (state is CounterSuccessState){
                number = state.number;
              }

              return state is CounterSuccessState ? Text(state.number.toString()) : Text('0');
            },
          ),
        ),
      ),
    );
  }
}
