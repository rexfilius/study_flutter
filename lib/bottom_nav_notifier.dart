import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavNotifierProvider = StateNotifierProvider<BottomNavNotifier, int>(
  (ref) => BottomNavNotifier(),
);

class BottomNavNotifier extends StateNotifier<int> {
  BottomNavNotifier() : super(0);

  void onTabTapped(int index) {
    state = index;
  }
}
