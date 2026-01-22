import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/bloc/todo/todo_bloc.dart';
import 'package:test/bloc/todo/todo_event.dart';
import 'package:test/bloc/todo/todo_state.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Todo Page")),
        body: Column(
          children: [
            Text('This is Todo page made using bloc'),
            SizedBox(
              height: 500,
              child: BlocBuilder<TodoBloc, TodoState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.todoList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            context.read<TodoBloc>().add(
                              RemoveTodo(task: state.todoList[index]),
                            );
                          },
                        ),
                        title: Title(
                          color: Colors.red,
                          child: Text(state.todoList[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // adding the todo here using bloc

            // add a dialog box to add the todo item
            showDialog(
              context: context,
              builder: (context) {
                String todoItem = '';

                return AlertDialog(
                  title: Text('Add Todo Item'),
                  content: TextField(
                    onChanged: (value) {
                      todoItem = value;
                    },
                    decoration: InputDecoration(hintText: "Enter todo item"),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        if (todoItem.isNotEmpty) {
                          context.read<TodoBloc>().add(AddTodo(task: todoItem));
                        }
                        Navigator.of(context).pop();
                      },
                      child: Text('Add'),
                    ),
                  ],
                );
              },
            );
            //// auto fill up for many todo items

            // for (int i = 0; i < 100; i++) {
            //   context.read<TodoBloc>().add(
            //     AddTodo(task: "Jeevan " + i.toString()),
            //   );
            // }
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
