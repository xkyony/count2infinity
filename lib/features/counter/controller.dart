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
Future<Counter?> counter(CounterRef ref, String id) async {
  return await ref.read(counterRepoProvider).fetch(id);
}

@riverpod
Stream<List<Counter>> counterList(CounterListRef ref) {
  return ref.read(counterRepoProvider).watchList;
}

@riverpod
class CounterController extends _$CounterController {
  @override
  Future<Counter> build() async {
    return ref.read(counterRepoProvider).fetchCurrentCounter();
  }

  Future<void> decrement() async {
    await ref.read(counterRepoProvider).decrementCurrentCounter();
    ref.invalidateSelf();
  }

  Future<void> increment() async {
    await ref.read(counterRepoProvider).incrementCurrentCounter();
  }

  Future<void> reset() async {
    await ref.read(counterRepoProvider).resetCurrentCounter();
  }

  Future<void> retrieveFromLocalDisk() async {
    final json = await ref.read(localStorageRepositoryProvider).read('current');
    final counter = json == null ? Counter.initial() : Counter.fromJson(json);
    await ref.read(counterRepoProvider).add(counter);
  }

  Future<void> saveToLocalDisk() async {
    final counter = await ref.read(counterRepoProvider).fetchCurrentCounter();
    await ref
        .read(localStorageRepositoryProvider)
        .write('current', counter.toJson());
  }

  void saveAt(DateTime time) async {
    final counter = await ref.read(counterRepoProvider).fetchCurrentCounter();
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
