// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CounterImpl _$$CounterImplFromJson(Map<String, dynamic> json) =>
    _$CounterImpl(
      id: json['id'] as String,
      value: (json['value'] as num).toInt(),
      at: DateTime.parse(json['at'] as String),
      minValue: (json['minValue'] as num).toInt(),
      minAt: DateTime.parse(json['minAt'] as String),
      maxValue: (json['maxValue'] as num).toInt(),
      maxAt: DateTime.parse(json['maxAt'] as String),
    );

Map<String, dynamic> _$$CounterImplToJson(_$CounterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'at': instance.at.toIso8601String(),
      'minValue': instance.minValue,
      'minAt': instance.minAt.toIso8601String(),
      'maxValue': instance.maxValue,
      'maxAt': instance.maxAt.toIso8601String(),
    };
