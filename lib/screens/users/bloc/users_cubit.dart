import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos/screens/users/model/users_response.dart';

import 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit()
      : super(UsersState(usersResponseStatues: UsersResponseStatues.initial));

  Dio dio = Dio();

  Future<void> fetchUsers() async {
    emit(UsersState(usersResponseStatues: UsersResponseStatues.loading));

    final response =
        await dio.get('https://jsonplaceholder.typicode.com/users');

    if (response.statusCode == 200) {
      final usersList = (response.data as List<dynamic>)
          .map((users) => UsersResponse.fromJson(users))
          .toList();

      emit(state.copyWith(
          usersResponseStatues: UsersResponseStatues.usersSuccess,
          usersResponse: usersList));
    } else {
      emit(state.copyWith(
          usersResponseStatues: UsersResponseStatues.failure,
          message: 'unable to fetch users list'));
    }
  }
}
