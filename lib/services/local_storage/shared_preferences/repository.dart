import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository.dart';
import 'service.dart';

part 'repository.g.dart';

@riverpod
Future<LocalStorageRepository> sharedPreferencesRepository(
  SharedPreferencesRepositoryRef ref,
) async {
  final service = await ref.read(sharedPreferencesProvider.future);
  return SharedPreferencesRepository(service);
}

class SharedPreferencesRepository implements LocalStorageRepository {
  final SharedPreferences client;

  SharedPreferencesRepository(this.client);

  @override
  Future<void> delete(String key) async {
    await client.remove(key);
  }

  @override
  Future<Map<String, dynamic>?> read(String key) async {
    final json = client.getString(key);
    if (json == null) return null;

    return jsonDecode(json) as Map<String, dynamic>;
  }

  @override
  Future<void> write(String key, Map<String, dynamic> value) async {
    final json = jsonEncode(value);
    await client.setString(key, json);
  }
}
