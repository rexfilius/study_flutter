import 'package:hooks_riverpod/hooks_riverpod.dart';

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

/// this does the same thing as the StateNotifier class
/// and it is the recommended class to extend
class BottomBarNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void onTabTapped(int index) {
    state = index;
  }
}
