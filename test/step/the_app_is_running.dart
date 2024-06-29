import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pharmacy/app.dart';
import 'package:pharmacy/features/counter/model.dart';
import 'package:pharmacy/features/counter/repository.dart';
import 'package:pharmacy/services/local_storage/repository.dart';
import 'package:pharmacy/services/local_storage/shared_preferences/repository.dart';

Future<void> theAppIsRunning(WidgetTester tester) async {
  final container = ProviderContainer();
  final localStorageRepository =
      await container.read(sharedPreferencesRepositoryProvider.future);
  // final firestore = container.read(firebaseFirestoreProvider);
  // set the initial value to 0
  final repo = container.read(counterRepoProvider);
  await repo.add(Counter.initial());
  final providerContainer = createProviderContainer(
    overrides: [
      localStorageRepositoryProvider.overrideWithValue(localStorageRepository),
    ],
  );

  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: providerContainer,
      child: const MyApp(),
    ),
  );
  await tester.pumpAndSettle();
}

ProviderContainer createProviderContainer({
  ProviderContainer? parent,
  List<Override> overrides = const [],
  List<ProviderObserver>? observers,
}) {
  final container = ProviderContainer(
    parent: parent,
    overrides: overrides,
    observers: observers,
  );
  addTearDown(() => container.dispose());
  return container;
}
