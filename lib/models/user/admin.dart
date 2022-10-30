import 'user.dart';

class Admin extends User {
  Admin(int id, String email, String username, String password)
      : super(id, email, username, password, 0);

  List<Admin> products = [
    Admin(
      0,
      "admin@gmail.com",
      "admin",
      "CSC42222F",
    )
  ];

  //addAdmin

  //addProduct

  //editProduct

  //deleteProduct

  //retrieveProducts
}
