import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_flutter/change_notifier_provider/product.dart';

class CartStateNotifier extends StateNotifier<List<Product>> {
  CartStateNotifier() : super([]);

  void addProduct(Product product) {
    state = [...state, product];
  }

  void clearCart() {
    state = [];
  }
}
