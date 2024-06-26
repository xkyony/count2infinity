import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:pharmacy/services/environment/model.dart';
import 'package:pharmacy/services/environment/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'instance.g.dart';

@riverpod
firebaseFirestore(FirebaseFirestoreRef ref) {
  final env = ref.read(currentEnvironmentProvider);
  return switch (env) {
    Env.test => FakeFirebaseFirestore(),
    Env.dev => uselocalEmulator(),
    Env.prod => FirebaseFirestore.instance,
    Env.integrationTest => FakeFirebaseFirestore(),
    Env.stag => throw UnimplementedError(),
  };
}

FirebaseFirestore uselocalEmulator() {
  final instance = FirebaseFirestore.instance;
  instance.useFirestoreEmulator('localhost', 8080);
  return instance;
}
