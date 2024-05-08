import 'package:photos/screens/todos_list/model/todos_response.dart';

enum TodosResponseStatus { initial, loading, fetchTodosSuccess, failure }

class TodosState {
  TodosResponseStatus? todosResponseStatus;
  List<TodosResponse>? todosResponse;
  String? message;

  TodosState(
      {required this.todosResponseStatus, this.todosResponse, this.message});

  TodosState copyWith(
      {TodosResponseStatus? todosResponseStatus,
      List<TodosResponse>? todosResponse,
      String? message}) {
    return TodosState(
        todosResponseStatus: todosResponseStatus,
        todosResponse: todosResponse ?? this.todosResponse,
        message: message ?? this.message);
  }
}
