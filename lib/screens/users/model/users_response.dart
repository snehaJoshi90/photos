import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'users_response.g.dart';

@JsonSerializable()
class UsersResponse {
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

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

@JsonSerializable(explicitToJson: true)
class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address();

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  static List<Address> parseJsonArray(String responseBody) {
    List<dynamic> responseMapList = json.decode(responseBody);
    return responseMapList.map((e) => Address.fromJson(e)).toList();
  }

  static Address parseJson(String responseBody) {
    return Address.fromJson(json.decode(responseBody));
  }
}

@JsonSerializable(explicitToJson: true)
class Geo {
  String? lat;
  String? lng;

  Geo();

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);

  Map<String, dynamic> toJson() => _$GeoToJson(this);

  static List<Geo> parseJsonArray(String responseBody) {
    List<dynamic> responseMapList = json.decode(responseBody);
    return responseMapList.map((e) => Geo.fromJson(e)).toList();
  }

  static Geo parseJson(String responseBody) {
    return Geo.fromJson(json.decode(responseBody));
  }
}

@JsonSerializable(explicitToJson: true)
class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company();

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);

  static List<Company> parseJsonArray(String responseBody) {
    List<dynamic> responseMapList = json.decode(responseBody);
    return responseMapList.map((e) => Company.fromJson(e)).toList();
  }

  static Company parseJson(String responseBody) {
    return Company.fromJson(json.decode(responseBody));
  }
}
