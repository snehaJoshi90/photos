import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:photos/screens/users/model/users_response.dart';

import 'create_profile_state.dart';

class CreateProfileCubit extends Cubit<CreateProfileState> {
  CreateProfileCubit()
      : super(CreateProfileState(
            createProfileResponseStatues:
                CreateProfileResponseStatues.initial));

  final Dio _dio = Dio();
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController suiteController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();


  Future<void> createProfile() async {
    emit(CreateProfileState(
        createProfileResponseStatues: CreateProfileResponseStatues.loading));

    String name = nameController.text;
    String userName = userNameController.text;
    String email = emailController.text;
    String street = streetController.text;
    String suite = suiteController.text;
    String city = cityController.text;
    String zipcode = zipcodeController.text;
    String phone = phoneController.text;


    final response =
        await _dio.post('https://jsonplaceholder.typicode.com/users', data: {
      'name': name,
      'username': userName,
      'email': email,
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'phone': phone,

    });
    print('data: ${response.data}');
    if (response.statusCode == 201) {
      final addUser = UsersResponse.fromJson(response.data);
      emit(state.copyWith(
          createProfileResponseStatues:
              CreateProfileResponseStatues.createProfileSuccess,
          usersResponse: addUser));
    } else {
      emit(state.copyWith(
          createProfileResponseStatues: CreateProfileResponseStatues.failure,
          message: 'Fail to create profile ${response.statusCode}'));
    }
  }
}
