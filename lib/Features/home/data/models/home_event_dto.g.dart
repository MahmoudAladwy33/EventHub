// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_event_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeEventDto _$HomeEventDtoFromJson(Map<String, dynamic> json) => HomeEventDto(
  id: json['id'] as String? ?? '',
  name: json['name'] as String? ?? '',
  imageUrl: json['imageUrl'] as String? ?? '',
  localDate: json['localDate'] as String? ?? '',
  localTime: json['localTime'] as String? ?? '',
  venueName: json['venueName'] as String? ?? '',
  city: json['city'] as String? ?? '',
  address: json['address'] as String? ?? '',
  distance: (json['distance'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$HomeEventDtoToJson(HomeEventDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'localDate': instance.localDate,
      'localTime': instance.localTime,
      'venueName': instance.venueName,
      'city': instance.city,
      'address': instance.address,
      'distance': instance.distance,
    };
