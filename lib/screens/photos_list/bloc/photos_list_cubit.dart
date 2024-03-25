import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:photos/screens/photos_list/model/photos_list_response.dart';
import 'photos_list_state.dart';

class PhotosListCubit extends Cubit<PhotoListState> {
  PhotosListCubit()
      : super(PhotoListState(
            photosListResponseStatus: PhotosListResponseStatus.initial));

  final Dio dio = Dio();

  Future<void> fetchPhotosList() async {
    emit(PhotoListState(
        photosListResponseStatus: PhotosListResponseStatus.loading));

    final response =
        await dio.get('https://jsonplaceholder.typicode.com/albums/1/photos');

    if (response.statusCode == 200) {
      final photosList = PhotosListResponse.fromJson(response.data);

      emit(state.copyWith(
          photosListResponseStatus: PhotosListResponseStatus.photosListSuccess,
          photosListResponse: photosList));
    } else {
      emit(state.copyWith(
          photosListResponseStatus: PhotosListResponseStatus.failure,
          message: 'Fail to fetch list'));
    }
  }
}
