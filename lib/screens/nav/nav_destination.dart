import 'package:flutter/material.dart';

class NavDestination {
  final String label;
  final IconData icon;

  const NavDestination({required this.label, required this.icon});
}

const navDestinations = [
  NavDestination(label: 'Home', icon: Icons.home_filled),
  NavDestination(label: 'Wallet', icon: Icons.wallet),
  NavDestination(label: 'Profile', icon: Icons.person),
];
