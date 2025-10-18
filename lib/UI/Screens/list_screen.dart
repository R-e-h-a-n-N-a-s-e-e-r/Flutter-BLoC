import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/BLoC/List%20Item/list_item_bloc.dart';
import 'package:flutter_bloc_practice/BLoC/List%20Item/list_item_event.dart';
import 'package:flutter_bloc_practice/BLoC/List%20Item/list_item_state.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'Task List',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<ListItemBloc, ListItemState>(
        builder: (context, state) {
          if (state.todoList.isEmpty) {
            return Center(child: Text('No Data Found'));
          } else if (state.todoList.isNotEmpty) {
            return ListView.builder(
              itemCount: state.todoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todoList[index]),
                  trailing: IconButton(
                    onPressed: () {
                      context.read<ListItemBloc>().add(
                        RemoveTodoList(itemIndex: state.todoList[index]),
                      );
                    },
                    icon: Icon(Icons.delete_outline),
                  ),
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          for (int i = 1; i < 11; i++) {
            context.read<ListItemBloc>().add(
              AddTodoList(task: 'Task ${i.toString()}'),
            );
          }
        },
      ),
    );
  }
}
