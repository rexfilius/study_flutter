import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PrefKeys {
  static const String hideBalance = 'hide_balance';
}

final appPrefProvider = Provider(
  (ref) => AppPrefs(),
);

// final setBooleanProvider =
//     FutureProvider.family<bool>((ref, value) async {
//   final appPref = ref.read(appPrefProvider);
//   return appPref.setBoolean(value);
// });

class AppPrefs {
  Future<SharedPreferences> _getPrefInstance() async {
    return await SharedPreferences.getInstance();
  }

  Future<bool> setBoolean(bool value) async {
    final v = await _getPrefInstance();
    return v.setBool(PrefKeys.hideBalance, value);
  }

  Future<bool?> getBoolean(String key) async {
    final v = await _getPrefInstance();
    return v.getBool(key);
  }
}
