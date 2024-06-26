import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pharmacy/app.dart';
import 'package:pharmacy/services/local_storage/repository.dart';
import 'package:pharmacy/services/local_storage/shared_preferences/repository.dart';

Future<void> theAppIsRunning(WidgetTester tester) async {
  final container = ProviderContainer();
  final localStorageRepository =
      await container.read(sharedPreferencesRepositoryProvider.future);

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
