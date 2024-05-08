import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'update_photos_response.g.dart';

@JsonSerializable()
class UpdatePhotosResponse {
  String? albumId;
  int? id;
  String? title;

  UpdatePhotosResponse();

  factory UpdatePhotosResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdatePhotosResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatePhotosResponseToJson(this);

  static List<UpdatePhotosResponse> parseJsonArray(String responseBody) {
    List<dynamic> responseMapList = json.decode(responseBody);
    return responseMapList
        .map((e) => UpdatePhotosResponse.fromJson(e))
        .toList();
  }

  static UpdatePhotosResponse parseJson(String responseBody) {
    return UpdatePhotosResponse.fromJson(json.decode(responseBody));
  }
}
