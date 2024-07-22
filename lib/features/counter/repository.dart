import 'package:pharmacy/features/counter/model.dart';
import 'package:pharmacy/services/database/cloud_firestore/instance.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/database/cloud_firestore/repository.dart';

part 'repository.g.dart';

@riverpod
CounterRepo counterRepo(CounterRepoRef ref) {
  final instance = ref.watch(firebaseFirestoreProvider);
  return CounterRepo(
    instance: instance,
    fromJson: Counter.fromJson,
    collection: Counter.collection,
  );
}

class CounterRepo extends FirebaseRepository<Counter> {
  CounterRepo({
    required super.collection,
    required super.fromJson,
    required super.instance,
  });

  Stream<Counter?> watchCurrentCounter() {
    return watch('current');
  }

  Future<Counter> fetchCurrentCounter() async {
    final counter = await fetch('current');
    if (counter != null) {
      return counter;
    }
    final initial = Counter.initial();
    await add(initial);
    return initial;
  }

  Future<void> decrement(Counter counter) async {
    await add(counter.decrement());
  }

  Future<void> decrementCurrentCounter() async {
    final counter = await fetchCurrentCounter();
    await add(counter.decrement());
  }

  Future<void> incrementCurrentCounter() async {
    final counter = await fetchCurrentCounter();
    await add(counter.increment());
  }

  Future<void> reset(Counter counter) async {
    await add(counter.reset());
  }
}
