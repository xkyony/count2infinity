import 'package:pharmacy/services/environment/model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
Env currentEnvironment(CurrentEnvironmentRef ref) {
  const env = String.fromEnvironment('env');
  return Env.fromString(env);
}
