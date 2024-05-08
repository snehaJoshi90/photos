import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:photos/screens/users/model/users_response.dart';
import 'add_company_details_state.dart';

class AddCompanyDetailsCubit extends Cubit<AddCompanyDetailsState> {
  AddCompanyDetailsCubit()
      : super(AddCompanyDetailsState(
            addCompanyDetailsStatues: AddCompanyDetailsStatues.initial));

  final Dio _dio = Dio();

  TextEditingController websiteController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController catchPhrasController = TextEditingController();
  TextEditingController bsController = TextEditingController();

  Future<void> addCompanyDetails() async {
    emit(AddCompanyDetailsState(
        addCompanyDetailsStatues: AddCompanyDetailsStatues.loading));

    String website = websiteController.text;
    String company = companyController.text;
    String catchPhras = catchPhrasController.text;
    String bs = bsController.text;

    final response = await _dio
        .post('https://jsonplaceholder.typicode.com/users', data: {
      'website': website,
      'catchPhrase': catchPhras,
      'bs': bs,
      'name': company
    });

    print('data: ${response.data}');
    if (response.statusCode == 201) {
      final addCompanyData = UsersResponse.fromJson(response.data);
      emit(state.copyWith(
          addCompanyDetailsStatues:
              AddCompanyDetailsStatues.addCompanyDetailsSuccess,
          usersResponse: addCompanyData));
    } else {
      emit(state.copyWith(
          addCompanyDetailsStatues: AddCompanyDetailsStatues.failure,
          message: 'Fail to create profile ${response.statusCode}'));
    }
  }
}
