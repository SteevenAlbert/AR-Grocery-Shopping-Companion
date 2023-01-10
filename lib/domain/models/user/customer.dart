import 'package:ar_grocery_companion/domain/models/product/product.dart';
import 'user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Customer extends User {
  Customer(int id, String email, String username, String password)
      : super(id, email, username, password, 0);

  static List<Product>? favourites = [];

  //addToFav

  //removeFromFav

}

class FavsNotifier extends StateNotifier<List<int>> {
  FavsNotifier() : super([]);

  void addItem(int productId) {
    state = [...state, productId];
  }

  void removeItem(int productId) {
    state = [
      for (final product in state)
        if (product != productId) product,
    ];
  }

  bool isFav(int productId) {
    var value = state.firstWhere((id) => id == productId, orElse: () => -1);
    if (value == -1) {
      return false;
    }
    return true;
  }
}

final favsProvider = StateNotifierProvider<FavsNotifier, List<int>>((ref) {
  return FavsNotifier();
});
