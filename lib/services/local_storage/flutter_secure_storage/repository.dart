import 'package:pharmacy/services/local_storage/repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageRepository implements LocalStorageRepository {
  final FlutterSecureStorage client;

  SecureStorageRepository(this.client);

  @override
  Future<void> save(String key, String value) async {
    await client.write(key: key, value: value);
  }

  @override
  Future<String?> read(String key) async {
    return await client.read(key: key);
  }

  @override
  Future<void> delete(String key) async {
    await client.delete(key: key);
  }
}
