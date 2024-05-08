import 'package:photos/screens/users/model/users_response.dart';

enum AddCompanyDetailsStatues {
  initial,
  loading,
  addCompanyDetailsSuccess,
  failure
}

class AddCompanyDetailsState {
  AddCompanyDetailsStatues? addCompanyDetailsStatues;
  UsersResponse? usersResponse;
  String? message;

  AddCompanyDetailsState(
      {required this.addCompanyDetailsStatues,
        this.usersResponse,
        this.message});

  AddCompanyDetailsState copyWith(
      {required AddCompanyDetailsStatues addCompanyDetailsStatues,
        UsersResponse? usersResponse,
        String? message}) {
    return AddCompanyDetailsState(
        addCompanyDetailsStatues: addCompanyDetailsStatues,
        usersResponse: usersResponse ?? this.usersResponse,
        message: message ?? this.message);
  }
}
