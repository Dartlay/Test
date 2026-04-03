import 'package:shared_preferences/shared_preferences.dart';

class SubscriptionLocalDataSource {
  final SharedPreferences prefs;
  SubscriptionLocalDataSource(this.prefs);

  static const _keyActive = 'sub_active';
  static const _keyType = 'sub_type';
  static const _keyExpires = 'sub_expires';

  Future<bool> getIsActive() async => prefs.getBool(_keyActive) ?? false;

  Future<String?> getType() async => prefs.getString(_keyType);

  Future<int?> getExpiresTimestamp() async => prefs.getInt(_keyExpires);

  Future<void> saveActive(String type, DateTime expires) async {
    await prefs.setBool(_keyActive, true);
    await prefs.setString(_keyType, type);
    await prefs.setInt(_keyExpires, expires.millisecondsSinceEpoch);
  }

  Future<void> clear() async => prefs.remove(_keyActive);
}
