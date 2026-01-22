import 'package:bloc/bloc.dart';
import 'package:test/bloc/todo/todo_event.dart';
import 'package:test/bloc/todo/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> newTodoList = [];
  TodoBloc() : super(TodoState()) {
    on<AddTodo>(_addTodo);
    on<RemoveTodo>(_removeTodo);
  }
  void _addTodo(AddTodo event, Emitter<TodoState> emit) {
    newTodoList.add(event.task);
    emit(state.copyWith(newTodoList: List.from(newTodoList)));
  }

  void _removeTodo(RemoveTodo event, Emitter<TodoState> emit) {
    newTodoList.remove(event.task);
    emit(
      state.copyWith(newTodoList: List.from(newTodoList)),
    ); // this must be List.from because we need to create a new list each time to emit the new state
  }
}
