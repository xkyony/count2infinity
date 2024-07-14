// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Counter _$CounterFromJson(Map<String, dynamic> json) {
  return _Counter.fromJson(json);
}

/// @nodoc
mixin _$Counter {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;
  DateTime get at => throw _privateConstructorUsedError;
  int get minValue => throw _privateConstructorUsedError;
  DateTime get minAt => throw _privateConstructorUsedError;
  int get maxValue => throw _privateConstructorUsedError;
  DateTime get maxAt => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CounterCopyWith<Counter> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterCopyWith<$Res> {
  factory $CounterCopyWith(Counter value, $Res Function(Counter) then) =
      _$CounterCopyWithImpl<$Res, Counter>;
  @useResult
  $Res call(
      {String id,
      String name,
      int value,
      DateTime at,
      int minValue,
      DateTime minAt,
      int maxValue,
      DateTime maxAt,
      String createdBy});
}

/// @nodoc
class _$CounterCopyWithImpl<$Res, $Val extends Counter>
    implements $CounterCopyWith<$Res> {
  _$CounterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? value = null,
    Object? at = null,
    Object? minValue = null,
    Object? minAt = null,
    Object? maxValue = null,
    Object? maxAt = null,
    Object? createdBy = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      at: null == at
          ? _value.at
          : at // ignore: cast_nullable_to_non_nullable
              as DateTime,
      minValue: null == minValue
          ? _value.minValue
          : minValue // ignore: cast_nullable_to_non_nullable
              as int,
      minAt: null == minAt
          ? _value.minAt
          : minAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      maxValue: null == maxValue
          ? _value.maxValue
          : maxValue // ignore: cast_nullable_to_non_nullable
              as int,
      maxAt: null == maxAt
          ? _value.maxAt
          : maxAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CounterImplCopyWith<$Res> implements $CounterCopyWith<$Res> {
  factory _$$CounterImplCopyWith(
          _$CounterImpl value, $Res Function(_$CounterImpl) then) =
      __$$CounterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int value,
      DateTime at,
      int minValue,
      DateTime minAt,
      int maxValue,
      DateTime maxAt,
      String createdBy});
}

/// @nodoc
class __$$CounterImplCopyWithImpl<$Res>
    extends _$CounterCopyWithImpl<$Res, _$CounterImpl>
    implements _$$CounterImplCopyWith<$Res> {
  __$$CounterImplCopyWithImpl(
      _$CounterImpl _value, $Res Function(_$CounterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? value = null,
    Object? at = null,
    Object? minValue = null,
    Object? minAt = null,
    Object? maxValue = null,
    Object? maxAt = null,
    Object? createdBy = null,
  }) {
    return _then(_$CounterImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      at: null == at
          ? _value.at
          : at // ignore: cast_nullable_to_non_nullable
              as DateTime,
      minValue: null == minValue
          ? _value.minValue
          : minValue // ignore: cast_nullable_to_non_nullable
              as int,
      minAt: null == minAt
          ? _value.minAt
          : minAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      maxValue: null == maxValue
          ? _value.maxValue
          : maxValue // ignore: cast_nullable_to_non_nullable
              as int,
      maxAt: null == maxAt
          ? _value.maxAt
          : maxAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CounterImpl extends _Counter {
  const _$CounterImpl(
      {required this.id,
      required this.name,
      required this.value,
      required this.at,
      required this.minValue,
      required this.minAt,
      required this.maxValue,
      required this.maxAt,
      this.createdBy = 'anonymous'})
      : super._();

  factory _$CounterImpl.fromJson(Map<String, dynamic> json) =>
      _$$CounterImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int value;
  @override
  final DateTime at;
  @override
  final int minValue;
  @override
  final DateTime minAt;
  @override
  final int maxValue;
  @override
  final DateTime maxAt;
  @override
  @JsonKey()
  final String createdBy;

  @override
  String toString() {
    return 'Counter(id: $id, name: $name, value: $value, at: $at, minValue: $minValue, minAt: $minAt, maxValue: $maxValue, maxAt: $maxAt, createdBy: $createdBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CounterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.at, at) || other.at == at) &&
            (identical(other.minValue, minValue) ||
                other.minValue == minValue) &&
            (identical(other.minAt, minAt) || other.minAt == minAt) &&
            (identical(other.maxValue, maxValue) ||
                other.maxValue == maxValue) &&
            (identical(other.maxAt, maxAt) || other.maxAt == maxAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, value, at, minValue,
      minAt, maxValue, maxAt, createdBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CounterImplCopyWith<_$CounterImpl> get copyWith =>
      __$$CounterImplCopyWithImpl<_$CounterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CounterImplToJson(
      this,
    );
  }
}

abstract class _Counter extends Counter {
  const factory _Counter(
      {required final String id,
      required final String name,
      required final int value,
      required final DateTime at,
      required final int minValue,
      required final DateTime minAt,
      required final int maxValue,
      required final DateTime maxAt,
      final String createdBy}) = _$CounterImpl;
  const _Counter._() : super._();

  factory _Counter.fromJson(Map<String, dynamic> json) = _$CounterImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get value;
  @override
  DateTime get at;
  @override
  int get minValue;
  @override
  DateTime get minAt;
  @override
  int get maxValue;
  @override
  DateTime get maxAt;
  @override
  String get createdBy;
  @override
  @JsonKey(ignore: true)
  _$$CounterImplCopyWith<_$CounterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
