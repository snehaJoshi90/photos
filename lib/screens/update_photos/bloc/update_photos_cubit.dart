import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//import 'package:photos/screens/photos_list/model/photos_list_response.dart';
import 'package:photos/screens/update_photos/bloc/update_photos_state.dart';
import 'package:photos/screens/update_photos/model/update_photos_response.dart';

class UpdatePhotosCubit extends Cubit<UpdatePhotosState> {
  UpdatePhotosCubit()
      : super(UpdatePhotosState(
            updatePhotosResponseStatus: UpdatePhotosResponseStatus.initial));

  final Dio _dio = Dio();
  TextEditingController titleController = TextEditingController();

  Future<void> updatePhotos() async {
    emit(UpdatePhotosState(
        updatePhotosResponseStatus: UpdatePhotosResponseStatus.loading));
    String title = titleController.text;

    final response = await _dio
        .post('https://jsonplaceholder.typicode.com/albums/1/photos', data: {
      'title': title,
    });
    print('data: ${response.data}');
    print('Response status code: ${response.statusCode}');

    if (response.statusCode == 201) {
      final update = UpdatePhotosResponse.fromJson(response.data);
      emit(state.copyWith(
          updatePhotosResponseStatus:
              UpdatePhotosResponseStatus.updatePhotosSuccess,
          updatePhotosResponse: update));
    } else {
      emit(state.copyWith(
          updatePhotosResponseStatus: UpdatePhotosResponseStatus.failure,
          message: 'Fail to update photos details'));
    }
  }
}
