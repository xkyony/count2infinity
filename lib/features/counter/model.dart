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
    required int value,
    required DateTime at,
  }) = _Counter;

  factory Counter.initial() => Counter(
        id: 'current',
        value: 0,
        at: DateTime.now(),
      );

  factory Counter.fromJson(Map<String, dynamic> json) =>
      _$CounterFromJson(json);

  Counter decrement() {
    return copyWith(
      value: value - 1,
      at: DateTime.now(),
    );
  }

  Counter increment() {
    return copyWith(
      value: value + 1,
      at: DateTime.now(),
    );
  }

  Counter reset() {
    return copyWith(
      value: 0,
      at: DateTime.now(),
    );
  }
}
