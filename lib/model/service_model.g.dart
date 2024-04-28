// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceModelImpl _$$ServiceModelImplFromJson(Map<String, dynamic> json) =>
    _$ServiceModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      field: json['field'] as String?,
      about: json['about'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      ratingRank: json['ratingRank'] as String?,
      salary: json['salary'] as String?,
      image: json['image'] as String?,
      isSaved: json['isSaved'] as bool? ?? false,
    );

Map<String, dynamic> _$$ServiceModelImplToJson(_$ServiceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'field': instance.field,
      'about': instance.about,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'ratingRank': instance.ratingRank,
      'salary': instance.salary,
      'image': instance.image,
      'isSaved': instance.isSaved,
    };
