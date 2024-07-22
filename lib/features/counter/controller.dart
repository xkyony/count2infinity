import 'package:pharmacy/features/counter/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/auth/repo.dart';
import '../../services/local_storage/repository.dart';
import 'model.dart';

part 'controller.g.dart';

@riverpod
Stream<Counter?> currentCounter(CurrentCounterRef ref) {
  return ref.read(counterRepoProvider).watchCurrentCounter();
}

@riverpod
Stream<Counter?> counter(CounterRef ref, String id) {
  return ref.read(counterRepoProvider).watch(id);
}

@riverpod
Stream<List<Counter>> counterList(CounterListRef ref) {
  return ref.read(counterRepoProvider).watchList;
}

@riverpod
class CounterController extends _$CounterController {
  @override
  void build() async {}

  Future<void> decrement(Counter counter) async {
    await ref.read(counterRepoProvider).add(counter.decrement());
  }

  Future<void> increment(Counter counter) async {
    await ref.read(counterRepoProvider).add(counter.increment());
  }

  Future<void> reset(Counter counter) async {
    await ref.read(counterRepoProvider).reset(counter);
  }

  Future<void> retrieveFromLocalDisk() async {
    final json = await ref.read(localStorageRepositoryProvider).read('current');
    final counter = json == null ? Counter.initial() : Counter.fromJson(json);
    await ref.read(counterRepoProvider).add(counter);
  }

  Future<void> saveToLocalDisk(Counter counter) async {
    await ref
        .read(localStorageRepositoryProvider)
        .write('current', counter.toJson());
  }

  void saveAt(DateTime time, Counter counter) async {
    final toBeSaved = counter.copyWith(at: time);
    await ref.read(counterRepoProvider).add(toBeSaved);
  }

  Future<void> add(Counter counter) async {
    final user = ref.read(authRepoProvider).currentUser;
    final counterWithCurrentUser = counter.copyWith(
      createdBy: user?.id ?? 'anonymous',
    );
    await ref.read(counterRepoProvider).add(counterWithCurrentUser);
  }

  delete(Counter counter) async {
    await ref.read(counterRepoProvider).delete(counter.id);
  }
}
