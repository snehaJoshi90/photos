// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photos_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotosListResponse _$PhotosListResponseFromJson(Map<String, dynamic> json) =>
    PhotosListResponse()
      ..albumId = json['albumId'] as int?
      ..id = json['id'] as int?
      ..title = json['title'] as String?
      ..url = json['url'] as String?
      ..thumbnailUrl = json['thumbnailUrl'] as String?;

Map<String, dynamic> _$PhotosListResponseToJson(PhotosListResponse instance) =>
    <String, dynamic>{
      'albumId': instance.albumId,
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };
