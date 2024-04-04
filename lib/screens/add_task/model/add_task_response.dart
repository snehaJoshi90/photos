import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'add_task_response.g.dart';

@JsonSerializable()

class AddTaskResponse{
  String? userId;
  int? id;
  String? title;
  bool? complete;

  AddTaskResponse();

  factory AddTaskResponse.fromJson(Map<String, dynamic> json) =>
          _$AddTaskResponseFromJson(json);

      Map<String, dynamic> toJson() => _$AddTaskResponseToJson(this);

      static List<AddTaskResponse> parseJsonArray(String responseBody) {
        List<dynamic> responseMapList = json.decode(responseBody);
        return responseMapList.map((e) => AddTaskResponse.fromJson(e)).toList();
      }

      static AddTaskResponse parseJson(String responseBody) {
        return AddTaskResponse.fromJson(json.decode(responseBody));
      }
}