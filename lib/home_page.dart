import 'package:flutter/material.dart';
import 'package:study_flutter/bottom_nav_notifier.dart';
import 'package:study_flutter/sub_home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static const List<Widget> homeTabs = [
    HomePage1(),
    HomePage2(),
    HomePage3(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navIndex = ref.watch(bottomNavNotifierProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: homeTabs.elementAt(navIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navIndex,
        onTap: ref.read(bottomNavNotifierProvider.notifier).onTabTapped,
        selectedItemColor: Colors.amber,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.abc_outlined),
            label: 'Pg1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.abc_outlined),
            label: 'Pg2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.abc_outlined),
            label: 'Pg3',
          )
        ],
      ),
    );
  }
}
