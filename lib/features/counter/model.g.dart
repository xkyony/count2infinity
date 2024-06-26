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
    );

Map<String, dynamic> _$$CounterImplToJson(_$CounterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'at': instance.at.toIso8601String(),
    };
