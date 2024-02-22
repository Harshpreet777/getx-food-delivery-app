import 'package:get_storage/get_storage.dart';

class UserStorage {
  static final GetStorage storage = GetStorage();
  static String emailKey = 'name';
  static String passKey = 'pass';
  static String user='user';

  static void setData(String key, dynamic value) => storage.write(key, value);

  static int? getInt(String key) => storage.read(key);

  static String? getString(String key) => storage.read(key);

  static bool? getBool(String key) => storage.read(key);

  static double? getDouble(String key) => storage.read(key);

  static dynamic getData(String key) => storage.read(key);

  static void clearData() async => storage.erase();
}
