import 'package:photos/screens/users/model/users_response.dart';

enum CreateProfileResponseStatues {
  initial,
  loading,
  createProfileSuccess,
  failure
}

class CreateProfileState {
  CreateProfileResponseStatues? createProfileResponseStatues;
  UsersResponse? usersResponse;
  String? message;

  CreateProfileState(
      {required this.createProfileResponseStatues,
      this.usersResponse,
      this.message});

  CreateProfileState copyWith({
    required CreateProfileResponseStatues createProfileResponseStatues,
    UsersResponse? usersResponse,
    String? message,
  }) {
    return CreateProfileState(
        createProfileResponseStatues: createProfileResponseStatues,
        usersResponse: usersResponse ?? this.usersResponse,
        message: message ?? this.message);
  }
}
