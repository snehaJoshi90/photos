//import 'package:photos/screens/photos_list/model/photos_list_response.dart';
import 'package:photos/screens/update_photos/model/update_photos_response.dart';

enum UpdatePhotosResponseStatus {
  initial,
  loading,
  updatePhotosSuccess,
  failure
}

class UpdatePhotosState {
  UpdatePhotosResponseStatus? updatePhotosResponseStatus;
  UpdatePhotosResponse? updatePhotosResponse;

  // PhotosListResponse? photosListResponse;
  String? message;

  UpdatePhotosState(
      {required this.updatePhotosResponseStatus,
      this.updatePhotosResponse,
      // this.photosListResponse,
      this.message});

  UpdatePhotosState copyWith(
      {required UpdatePhotosResponseStatus? updatePhotosResponseStatus,
      UpdatePhotosResponse? updatePhotosResponse,
      //PhotosListResponse? photosListResponse,
      String? message}) {
    return UpdatePhotosState(
        updatePhotosResponseStatus: updatePhotosResponseStatus,
        updatePhotosResponse: updatePhotosResponse ?? this.updatePhotosResponse,
        // photosListResponse: photosListResponse ?? this.photosListResponse,
        message: message ?? this.message);
  }
}
