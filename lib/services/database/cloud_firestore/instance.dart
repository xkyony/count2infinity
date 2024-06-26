import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pharmacy/services/environment/model.dart';
import 'package:pharmacy/services/environment/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../firebase_options.dart';

part 'instance.g.dart';

@riverpod
Future<FirebaseApp> firebaseApp(FirebaseAppRef ref) async {
  return await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

@Riverpod(keepAlive: true)
FirebaseFirestore firebaseFirestore(FirebaseFirestoreRef ref) {
  final env = ref.read(currentEnvironmentProvider);
  return switch (env) {
    Env.test => FakeFirebaseFirestore(),
    // Env.dev => uselocalEmulator(),
    Env.dev => FirebaseFirestore.instance,
    Env.prod => FirebaseFirestore.instance,
    Env.integrationTest => FakeFirebaseFirestore(),
    Env.stag => FirebaseFirestore.instance,
  };
}

FirebaseFirestore uselocalEmulator() {
  final instance = FirebaseFirestore.instance;
  instance.useFirestoreEmulator('localhost', 8080);
  return instance;
}
