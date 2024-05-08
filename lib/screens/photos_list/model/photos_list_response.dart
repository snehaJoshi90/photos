import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'photos_list_response.g.dart';

@JsonSerializable()
class PhotosListResponse {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  PhotosListResponse();

  factory PhotosListResponse.fromJson(Map<String, dynamic> json) =>
      _$PhotosListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PhotosListResponseToJson(this);

  static List<PhotosListResponse> parseJsonArray(String responseBody) {
    List<dynamic> responseMapList = json.decode(responseBody);
    return responseMapList.map((e) => PhotosListResponse.fromJson(e)).toList();
  }

  static PhotosListResponse parseJson(String responseBody) {
    return PhotosListResponse.fromJson(json.decode(responseBody));
  }
}
