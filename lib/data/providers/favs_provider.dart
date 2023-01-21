import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ar_grocery_companion/data/repositories/users_repository.dart';
import 'package:ar_grocery_companion/domain/models/user/app_user.dart';

AppUsersRepository usersRepo = AppUsersRepository.instance;

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

  Future<void> update(AppUser appUser) async {
    usersRepo.updateAppUser(appUser: appUser);
    print(state);
  }
}

final favsProvider = StateNotifierProvider<FavsNotifier, List<String>>((ref) {
  return FavsNotifier();
});
