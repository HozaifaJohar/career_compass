import 'package:shared_preferences/shared_preferences.dart';

class CashMemory {
  static late SharedPreferences preferences;

  Future init() async => preferences = await SharedPreferences.getInstance();

  //We can use Future<bool> to tell us if data stored successfully or not
  Future insertToCash({required String key, required String value}) async {
    return await preferences.setString(key, value);
  }

  String getCashData({required String key}) {
    return preferences.getString(key) ?? '';
  }

  Future<bool> daleteCashItem({required String key}) async {
    return await preferences.remove(key);
  }

  Future<bool> clearCash() async {
    return await preferences.clear();
  }
}
