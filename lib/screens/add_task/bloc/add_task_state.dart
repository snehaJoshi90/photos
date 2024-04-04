import 'package:photos/screens/add_task/model/add_task_response.dart';

enum AddTaskResponseStatus { initial, loading, addTaskSuccess, failure }

class AddTaskState {
  AddTaskResponseStatus? addTaskResponseStatus;
  AddTaskResponse? addTaskResponse;
  String? message;

  AddTaskState(
      {required this.addTaskResponseStatus,
      this.addTaskResponse,
      this.message});

  AddTaskState copyWith({
    AddTaskResponseStatus? addTaskResponseStatus,
    AddTaskResponse? addTaskResponse,
    String? message,
  }) {
    return AddTaskState(
        addTaskResponseStatus: addTaskResponseStatus,
        addTaskResponse: addTaskResponse ?? this.addTaskResponse,
        message: message ?? this.message);
  }
}
