import 'package:equatable/equatable.dart';

abstract class ListItemEvent extends Equatable {
  const ListItemEvent();
}

class AddTodoList extends ListItemEvent {
  final String task;

  const AddTodoList({required this.task});

  @override
  // TODO: implement props
  List<Object?> get props => [task];
}

class RemoveTodoList extends ListItemEvent {
  final String itemIndex;

  const RemoveTodoList({required this.itemIndex});

  @override
  // TODO: implement props
  List<Object?> get props => [itemIndex];
}
