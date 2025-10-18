import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/BLoC/Counter/counter_bloc.dart';
import 'package:flutter_bloc_practice/BLoC/Image%20Picker/image_picker_bloc.dart';
import 'package:flutter_bloc_practice/BLoC/List%20Item/list_item_bloc.dart';
import 'package:flutter_bloc_practice/BLoC/Switch/switch_bloc.dart';
import 'package:flutter_bloc_practice/UI/Screens/list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => ImagePickerBloc()),
        BlocProvider(create: (_) => ListItemBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: ListScreen(),
      ),
    );
  }
}
