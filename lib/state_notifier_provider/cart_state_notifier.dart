import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_flutter/change_notifier_provider/product.dart';

final cartStateNotifierProvider =
    StateNotifierProvider.autoDispose<CartStateNotifier, List<Product>>((ref) {
  return CartStateNotifier();
});

class CartStateNotifier extends StateNotifier<List<Product>> {
  CartStateNotifier() : super([]);

  void addProduct(Product product) {
    state = [...state, product];
  }

  void removeProduct(Product product) {
    state = state.where((Product element) => element != product).toList();
  }

  void clearCart() {
    state = [];
  }
}
