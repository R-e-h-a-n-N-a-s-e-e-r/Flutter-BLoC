import 'package:equatable/equatable.dart';

class ListItemState extends Equatable {
  final List<String> todoList;

  const ListItemState({required this.todoList});

  ListItemState copyWith({List<String>? todoList}) {
    return ListItemState(todoList: todoList ?? this.todoList);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [todoList];
}
