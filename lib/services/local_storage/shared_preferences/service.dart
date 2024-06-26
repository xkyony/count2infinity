import 'package:pharmacy/services/environment/model.dart';
import 'package:pharmacy/services/environment/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'service.g.dart';

@riverpod
Future<SharedPreferences> sharedPreferences(
  SharedPreferencesRef ref,
) async {
  final env = ref.read(currentEnvironmentProvider);
  if (env == Env.test) {
    SharedPreferences.setMockInitialValues({});
  }
  return await SharedPreferences.getInstance();
}
