import '../../services/model.dart';

class Counter extends Model {
  const Counter({
    required this.value,
    required this.at,

  });
  final int value;
  final DateTime at;

  @override
  String get collection => '';
  


  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'at': at.toIso8601String(),
    };
  }

  static Counter fromJson(Map<String, dynamic> json) {
    return Counter(
      value: json['value'],
      at: DateTime.parse(json['at']),
    );
  }

  Counter decrement() {
    return Counter(
      value: value - 1,
      at: DateTime.now(),
    );
  }

  Counter increment() {
    return Counter(
      value: value + 1,
      at: DateTime.now(),
    );
  }

  Counter reset() {
    return Counter(
      value: 0,
      at: DateTime.now(),
    );
  }
}
