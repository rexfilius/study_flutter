import 'package:flutter/material.dart';
import 'package:study_flutter/list_item.dart';
import 'package:study_flutter/shimmer.dart';
import 'package:study_flutter/shimmer_loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shimmer Effect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

const shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Shimmer(
        linearGradient: shimmerGradient,
        child: ListView(
          physics: _isLoading ? const NeverScrollableScrollPhysics() : null,
          children: [
            const SizedBox(height: 16),
            TopRowListWidget(isLoading: _isLoading),
            const SizedBox(height: 16),
            ListItemWidget(isLoading: _isLoading),
            ListItemWidget(isLoading: _isLoading),
            ListItemWidget(isLoading: _isLoading),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleLoading,
        child: Icon(
          _isLoading ? Icons.hourglass_full : Icons.hourglass_bottom,
        ),
      ),
    );
  }
}

class TopRowListWidget extends StatelessWidget {
  const TopRowListWidget({required this.isLoading, super.key});

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: ListView(
        physics: isLoading ? const NeverScrollableScrollPhysics() : null,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          const SizedBox(width: 16),
          TopRowItemWidget(isLoading: isLoading),
          TopRowItemWidget(isLoading: isLoading),
          TopRowItemWidget(isLoading: isLoading),
          TopRowItemWidget(isLoading: isLoading),
          TopRowItemWidget(isLoading: isLoading),
          TopRowItemWidget(isLoading: isLoading),
        ],
      ),
    );
  }
}

class TopRowItemWidget extends StatelessWidget {
  const TopRowItemWidget({required this.isLoading, super.key});

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      isLoading: isLoading,
      child: const CircleListItem(),
    );
  }
}

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({required this.isLoading, super.key});

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      isLoading: isLoading,
      child: CardListItem(
        isLoading: isLoading,
      ),
    );
  }
}
