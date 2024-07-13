import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../environment/model.dart';
import '../../environment/provider.dart';

part 'instance.g.dart';

@Riverpod(keepAlive: true)
FirebaseFunctions cloudFunctions(CloudFunctionsRef ref) {
  final env = ref.read(currentEnvironmentProvider);
  if (env == Env.test) {
    return FirebaseFunctions.instanceFor(app: MockFirebaseAuth().app);
  }
  final instance = FirebaseFunctions.instance;
  // if (env == Env.dev) {
  //   instance.useFunctionsEmulator('localhost', 5001);
  //   return instance;
  // }
  return instance;
}
