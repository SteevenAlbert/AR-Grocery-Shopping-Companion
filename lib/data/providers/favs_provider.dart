import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavsNotifier extends StateNotifier<List<String>> {
  FavsNotifier() : super([]);

  void addItem(String productId) {
    state = [...state, productId];
  }

  void removeItem(String productId) {
    state = [
      for (final product in state)
        if (product != productId) product,
    ];
  }

  bool isFav(String productId) {
    var value = state.firstWhere((id) => id == productId, orElse: () => "-1");
    if (value == "-1") {
      return false;
    }
    return true;
  }
}

final favsProvider = StateNotifierProvider<FavsNotifier, List<String>>((ref) {
  return FavsNotifier();
});
