import 'package:firebase_auth/firebase_auth.dart';
import 'package:pharmacy/services/environment/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';

import '../../environment/model.dart';

part 'instance.g.dart';

@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) {
  final env = ref.read(currentEnvironmentProvider);
  return switch (env) {
    Env.test => MockFirebaseAuth(),
    // Env.dev => FirebaseAuth.instance.localEmulator,
    Env.dev => FirebaseAuth.instance,
    Env.prod => FirebaseAuth.instance,
    Env.integrationTest => FirebaseAuth.instance,
    Env.stag => FirebaseAuth.instance,
  };
}

extension FirebaseAuthX on FirebaseAuth {
  FirebaseAuth get localEmulator {
    useAuthEmulator('localhost', 9099);
    return this;
  }
}
