import 'package:wireguard_dart_example/config/storage.dart';

class StorageRepository {
  final storage = LocalStorage().storage;

  Future<String?> getToken() async {
    final String? token = await storage.read(key: StorageConstants().idToken);
    return token;
  }
}
