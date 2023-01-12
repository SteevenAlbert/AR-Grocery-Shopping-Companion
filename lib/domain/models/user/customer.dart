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
