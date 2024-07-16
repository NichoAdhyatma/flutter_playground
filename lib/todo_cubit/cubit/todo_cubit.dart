import 'dart:developer';

import 'package:belajar_bloc/todo_cubit/models/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<TodoModel>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    if (title.isEmpty) {
      addError('Title cannot be empty!');
      return;
    }

    var todo = TodoModel(
      title: title,
      createdAt: DateTime.now(),
    );

    state.add(todo);

    emit(List.from(state));
  }

  @override
  void onChange(Change<List<TodoModel>> change) {
    log('TodoCubit: $change');
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    log('TodoCubit: $error');
    super.onError(error, stackTrace);
  }
}
