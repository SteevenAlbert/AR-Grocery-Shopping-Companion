import 'package:ar_grocery_companion/models/product.dart';

import 'user.dart';

class Customer extends User {
  Customer(int id, String username, String password)
      : super(id, username, password, 0);

  List<Product>? favourites;

  //addToFav

  //removeFromFav

}
