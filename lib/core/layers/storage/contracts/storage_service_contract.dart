abstract interface class StorageService {
  Future<void> setInt(String key, int value);

  Future<void> setDouble(String key, double value);

  Future<void> setBool(String key, bool value);

  Future<void> setString(String key, String value);

  Future<void> setStringList(String key, List<String> value);

  Future<int?> getInt(String key);

  Future<double?> getDouble(String key);

  Future<bool?> getBool(String key);

  Future<String?> getString(String key);

  Future<List<String>?> getStringList(String key);

  Future<void> deleteValue(String key);

  Future<void> deleteAll();
}
