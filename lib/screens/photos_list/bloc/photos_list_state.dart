import 'package:photos/screens/photos_list/model/photos_list_response.dart';

enum PhotosListResponseStatus { initial, loading, photosListSuccess, failure }

class PhotoListState {
  PhotosListResponseStatus photosListResponseStatus;
  PhotosListResponse? photosListResponse;
  String? message;

  PhotoListState(
      {required this.photosListResponseStatus,
      this.photosListResponse,
      this.message});

  PhotoListState copyWith({
    required PhotosListResponseStatus photosListResponseStatus,
    PhotosListResponse? photosListResponse,
    String? message,
  }) {
    return PhotoListState(
        photosListResponseStatus: photosListResponseStatus,
        photosListResponse: photosListResponse ?? this.photosListResponse,
        message: message ?? this.message);
  }
}
