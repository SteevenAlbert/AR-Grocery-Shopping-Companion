import 'package:ar_grocery_companion/models/product.dart';
import 'user.dart';

class Customer extends User {
  Customer(int id, String email, String username, String password)
      : super(id, email, username, password, 0);

  static List<Product>? favourites = [];

  //addToFav

  //removeFromFav

}
