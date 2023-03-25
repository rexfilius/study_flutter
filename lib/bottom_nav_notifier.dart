import 'package:flutter_riverpod/flutter_riverpod.dart';

// final bottomNavNotifierProvider = StateNotifierProvider<BottomNavNotifier, int>(
//   (ref) => BottomNavNotifier(),
// );

final bottomNavNotifierProvider = NotifierProvider<BottomBarNotifier, int>(
  () => BottomBarNotifier(),
);

class BottomNavNotifier extends StateNotifier<int> {
  BottomNavNotifier() : super(0);

  void onTabTapped(int index) {
    state = index;
  }
}

class BottomBarNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void onTabTapped(int index) {
    state = index;
  }
}
