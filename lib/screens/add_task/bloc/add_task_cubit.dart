import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos/screens/add_task/model/add_task_response.dart';
import 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit()
      : super(
            AddTaskState(addTaskResponseStatus: AddTaskResponseStatus.initial));

  final Dio dio = Dio();
  TextEditingController titleController = TextEditingController();

  Future<void> addTaskDetails() async {
    emit(AddTaskState(addTaskResponseStatus: AddTaskResponseStatus.loading));

    String title = titleController.text;

    final response = await dio.post(
        'https://jsonplaceholder.typicode.com/users/1/todos',
        data: {'title': title});

    if (response.statusCode == 201) {
      final addTask = AddTaskResponse.fromJson(response.data);

      emit(state.copyWith(
          addTaskResponseStatus: AddTaskResponseStatus.addTaskSuccess,
          addTaskResponse: addTask));
    } else {
      emit(state.copyWith(
          addTaskResponseStatus: AddTaskResponseStatus.failure,
          message: 'Unable to save details'));
    }
  }
}
