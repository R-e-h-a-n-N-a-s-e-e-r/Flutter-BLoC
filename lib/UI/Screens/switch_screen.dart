import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/BLoC/Switch/switch_bloc.dart';
import 'package:flutter_bloc_practice/BLoC/Switch/switch_events.dart';
import 'package:flutter_bloc_practice/BLoC/Switch/switch_states.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    print('Rebuilding');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BLoC',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<SwitchBloc, SwitchStates>(
              buildWhen: (previous, current) =>
                  previous.isSwitch != current.isSwitch,
              builder: (context, state) {
                print('Change Notification');
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Notification',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.indigo,
                      ),
                    ),
                    Switch(
                      value: state.isSwitch,
                      onChanged: (value) {
                        context.read<SwitchBloc>().add(
                          EnableOrDisableNotification(),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
            BlocBuilder<SwitchBloc, SwitchStates>(
              buildWhen: (previous, current) => previous.value != current.value,
              builder: (context, state) {
                print('Container Opacity');
                return Container(
                  color: Colors.red.withValues(alpha: state.value),
                  height: 200,
                );
              },
            ),

            BlocBuilder<SwitchBloc, SwitchStates>(
              builder: (context, state) {
                return Slider(
                  value: state.value,
                  onChanged: (value) {
                    context.read<SwitchBloc>().add(
                      ChangeOpacity(opacityValue: value),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
