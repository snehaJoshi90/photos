import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos/screens/todos_list/model/todos_response.dart';
import 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  TodosCubit()
      : super(TodosState(todosResponseStatus: TodosResponseStatus.initial));

  final Dio dio = Dio();

  Future<void> fetchTodosList() async {
    emit(TodosState(todosResponseStatus: TodosResponseStatus.loading));

    final response =
        await dio.get('https://jsonplaceholder.typicode.com/users/1/todos');

    if (response.statusCode == 200) {
      final todosList = (response.data as List<dynamic>)
          .map((item) => TodosResponse.fromJson(item))
          .toList();

      emit(state.copyWith(
          todosResponseStatus: TodosResponseStatus.fetchTodosSuccess,
          todosResponse: todosList));
    } else {
      emit(state.copyWith(
          todosResponseStatus: TodosResponseStatus.failure,
          message: 'Fail to fetch list'));
    }
  }
}
