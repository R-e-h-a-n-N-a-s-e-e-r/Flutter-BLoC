import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/BLoC/Counter/counter_bloc.dart';
import 'package:flutter_bloc_practice/BLoC/Counter/counter_events.dart';
import 'package:flutter_bloc_practice/BLoC/Counter/counter_states.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Counter',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterStates>(
            builder: (context, value) {
              return Center(
                child: Text(
                  value.counter.toString(),
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                ),
              );
            },
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(CounterIncremented());
                },
                child: Text('Increment'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(CounterDecremented());
                },
                child: Text('decrement'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
