import 'package:belajar_bloc/todo_cubit/cubit/todo_cubit.dart';
import 'package:belajar_bloc/todo_cubit/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: BlocBuilder<TodoCubit, List<TodoModel>>(
        builder: (context, todos) {
          return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                var todo = todos[index];
                return ListTile(
                  title: Text(todo.title),
                  subtitle: Text(todo.createdAt.toString()),
                  onTap: () {
                    Navigator.pushNamed(context, '/add-todo');
                  },
                );
              });
        },
      ),
      // body: ,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-todo');
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
