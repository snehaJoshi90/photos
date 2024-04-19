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
  TextEditingController websiteController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController catchPhrasController = TextEditingController();
  TextEditingController bsController = TextEditingController();

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
    String website = websiteController.text;
    String company = companyController.text;
    String catchPhras = catchPhrasController.text;
    String bs = bsController.text;

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
      'website': website,
      'catchPhrase': catchPhras,
      'bs': bs
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
