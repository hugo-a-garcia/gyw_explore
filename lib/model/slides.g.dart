// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slides.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SlidesImpl _$$SlidesImplFromJson(Map<String, dynamic> json) => _$SlidesImpl(
      name: json['name'] as String,
      drawings: (json['drawings'] as List<dynamic>)
          .map((e) => GYWDrawing.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SlidesImplToJson(_$SlidesImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'drawings': instance.drawings,
    };
