import 'package:equatable/equatable.dart';

class TodoState extends Equatable {
  final List<String> todoList;
  const TodoState({
    this.todoList = const [],
  }); // give the initial state of list in this constructor

  @override
  List<Object?> get props => [todoList];

  TodoState copyWith({List<String>? newTodoList}) {
    return TodoState(todoList: newTodoList ?? todoList);
  }
}
