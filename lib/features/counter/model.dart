import 'dart:math';

import '../../services/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.g.dart';
part 'model.freezed.dart';

@freezed
class Counter with _$Counter, Model {
  static get collection => 'counter';

  const Counter._();

  const factory Counter({
    required String id,
    required String name,
    required int value,
    required DateTime at,
    required int minValue,
    required DateTime minAt,
    required int maxValue,
    required DateTime maxAt,
  }) = _Counter;

  factory Counter.initial() => Counter(
        id: 'current',
        name: 'Current Counter',
        value: 0,
        at: DateTime.now(),
        maxValue: 0,
        maxAt: DateTime.now(),
        minValue: 0,
        minAt: DateTime.now(),
      );

  factory Counter.fromJson(Map<String, dynamic> json) =>
      _$CounterFromJson(json);

  Counter decrement() {
    return copyWith(
      value: value - 1,
      at: DateTime.now(),
      minValue: min(minValue, value - 1),
      minAt: minValue > value - 1 ? DateTime.now() : minAt,
    );
  }

  Counter increment() {
    return copyWith(
      value: value + 1,
      at: DateTime.now(),
      maxValue: max(maxValue, value + 1),
      maxAt: maxValue < value + 1 ? DateTime.now() : maxAt,
    );
  }

  Counter reset() {
    return copyWith(
      value: 0,
      at: DateTime.now(),
      maxValue: max(maxValue, 0),
      maxAt: maxValue < 0 ? DateTime.now() : at,
      minValue: min(minValue, 0),
      minAt: minValue > 0 ? DateTime.now() : minAt,
    );
  }
}
