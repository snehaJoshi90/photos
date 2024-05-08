import 'package:photos/screens/users/model/users_response.dart';

enum UsersResponseStatues { initial, loading, usersSuccess, failure }

class UsersState {
  UsersResponseStatues? usersResponseStatues;
 List<UsersResponse> ? usersResponse;
  String? message;

  UsersState(
      {required this.usersResponseStatues, this.usersResponse, this.message});

  UsersState copyWith({
    UsersResponseStatues? usersResponseStatues,
   List<UsersResponse> ? usersResponse,
    String? message,
  }) {
    return UsersState(
        usersResponseStatues: usersResponseStatues,
        usersResponse: usersResponse ?? this.usersResponse,
        message: message ?? this.message);
  }
}
