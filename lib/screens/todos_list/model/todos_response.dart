import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'todos_response.g.dart';

@JsonSerializable()
class TodosResponse {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  TodosResponse();

  factory TodosResponse.fromJson(Map<String, dynamic> json) =>
      _$TodosResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TodosResponseToJson(this);

  static List<TodosResponse> parseJsonArray(String responseBody) {
    List<dynamic> responseMapList = json.decode(responseBody);
    return responseMapList.map((e) => TodosResponse.fromJson(e)).toList();
  }

  static TodosResponse parseJson(String responseBody) {
    return TodosResponse.fromJson(json.decode(responseBody));
  }
}
