import 'package:ar_grocery_companion/models/product.dart';

import 'user.dart';

class Customer extends User {
  Customer(int id, String email, String username, String password)
      : super(id, email, username, password, 0);

  List<Product>? favourites;

  List<Customer> products = [
    Customer(
      0,
      "customer@gmail.com",
      "customer",
      "CSC422",
    )
  ];

  //addToFav

  //removeFromFav

}
