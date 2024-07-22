import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pharmacy/app.dart';
import 'package:pharmacy/services/auth/firebase/repo.dart';
import 'package:pharmacy/services/auth/repo.dart';
import 'package:pharmacy/services/cloud_functions/firebase/instance.dart';
import 'package:pharmacy/services/database/cloud_firestore/instance.dart';
import 'package:pharmacy/services/local_storage/repository.dart';
import 'package:pharmacy/services/local_storage/shared_preferences/repository.dart';

Future<void> theAppIsRunning(WidgetTester tester) async {
  TestWidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  final localStorageRepository =
      await container.read(sharedPreferencesRepositoryProvider.future);
  // final firestore = container.read(firebaseFirestoreProvider);
  // set the initial value to 0
  // final firebaseApp = await Firebase.initializeApp();
  // await container.read(firebaseAppProvider.future);
  // await Firebase.initializeApp();
  setFirebaseUiIsTestMode(true);
  final auth = MockFirebaseAuth(
    signedIn: true,
    mockUser: MockUser(
      isAnonymous: false,
      uid: 'Mr.Bean',
      email: 'mrbean@hari.co',
      displayName: 'Mr.Bean',
    ),
    signInMethodsForEmail: {
      'mrbean@hari.co': ['Qu1rkY!']
    },
  );

  final authRepo = FirebaseAuthRepo(
    auth: auth,
    functions: container.read(cloudFunctionsProvider),
  );

  final providerContainer = createProviderContainer(
    overrides: [
      localStorageRepositoryProvider.overrideWithValue(localStorageRepository),
      authRepoProvider.overrideWithValue(authRepo),
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
