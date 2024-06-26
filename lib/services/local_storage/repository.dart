import 'package:riverpod_annotation/riverpod_annotation.dart';

abstract class LocalStorageRepository {
  Future<void> write(String key, Map<String, dynamic> value);
  Future<Map<String, dynamic>?> read(String key);
  Future<void> delete(String key);
}

final localStorageRepositoryProvider = Provider<LocalStorageRepository>((ref) {
  throw UnimplementedError();
});
