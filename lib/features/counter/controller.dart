import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/local_storage/repository.dart';
import 'model.dart';

part 'controller.g.dart';

@riverpod
Future<Counter> counter(CounterRef ref) async {
  return ref.watch(counterControllerProvider);
}

@riverpod
class CounterController extends _$CounterController {
  @override
  Counter build() => Counter(
        value: 0,
        at: DateTime.now(),
      );

  void decrement() => state = state.decrement();
  void increment() {
    state = state.increment();
  }

  void reset() => state = state.reset();

  void retrieveFromLocalDisk() async {
    final json = await ref.read(localStorageRepositoryProvider).read('counter');
    if (json != null) {
      state = Counter.fromJson(json);
    }
  }

  void saveToLocalDisk() async {
    await ref
        .read(localStorageRepositoryProvider)
        .write('counter', state.toJson());
  }

  void saveAt(DateTime time) {
    state = Counter(value: state.value, at: time);
  }
}
