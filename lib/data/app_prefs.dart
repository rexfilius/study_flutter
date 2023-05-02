import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final balanceProvider = StateProvider<bool>((ref) {
  final preferences = ref.watch(sharedPreferencesProvider);
  final currentValue = preferences.getBool(PrefKeys.hideBalance) ?? false;
  ref.listenSelf((previous, current) {
    preferences.setBool(PrefKeys.hideBalance, current);
  });
  return currentValue;
});

abstract class PrefKeys {
  static const hideBalance = 'hide_balance';
}
