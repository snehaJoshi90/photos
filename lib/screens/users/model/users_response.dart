import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'users_response.g.dart';

@JsonSerializable()

class UsersResponse{
  int? id;
  String? name;
  String? username;
  String? email;

  UsersResponse();

  factory UsersResponse.fromJson(Map<String, dynamic> json) =>
          _$UsersResponseFromJson(json);

      Map<String, dynamic> toJson() => _$UsersResponseToJson(this);

      static List<UsersResponse> parseJsonArray(String responseBody) {
        List<dynamic> responseMapList = json.decode(responseBody);
        return responseMapList.map((e) => UsersResponse.fromJson(e)).toList();
      }

      static UsersResponse parseJson(String responseBody) {
        return UsersResponse.fromJson(json.decode(responseBody));
      }

}




// {
// "id": 1,
// "name": "Leanne Graham",
// "username": "Bret",
// "email": "Sincere@april.biz",
// "address": {
// "street": "Kulas Light",
// "suite": "Apt. 556",
// "city": "Gwenborough",
// "zipcode": "92998-3874",
// "geo": {
// "lat": "-37.3159",
// "lng": "81.1496"
// }
// },
// "phone": "1-770-736-8031 x56442",
// "website": "hildegard.org",
// "company": {
// "name": "Romaguera-Crona",
// "catchPhrase": "Multi-layered client-server neural-net",
// "bs": "harness real-time e-markets"
// }
// }