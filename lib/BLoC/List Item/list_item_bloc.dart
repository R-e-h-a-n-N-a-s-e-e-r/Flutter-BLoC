import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_practice/BLoC/List%20Item/list_item_event.dart';
import 'package:flutter_bloc_practice/BLoC/List%20Item/list_item_state.dart';

class ListItemBloc extends Bloc<ListItemEvent, ListItemState> {
  final List<String> todoList = [];

  ListItemBloc() : super(ListItemState(todoList: [])) {
    on<AddTodoList>(_addTodoList);
    on<RemoveTodoList>(_removeTodoList);
  }

  void _addTodoList(AddTodoList event, Emitter<ListItemState> emit) {
    todoList.add(event.task);
    emit(state.copyWith(todoList: List.from(todoList)));
  }

  void _removeTodoList(RemoveTodoList event, Emitter<ListItemState> emit) {
    todoList.remove(event.itemIndex);
    emit(state.copyWith(todoList: List.from(todoList)));
  }
}
