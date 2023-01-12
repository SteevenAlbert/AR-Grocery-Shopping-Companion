class User {
  int? id;
  String? email;
  String? username;
  String? password;
  //date_of_birth
  //gender
  //image
  int? type;

  User(this.id, this.email, this.username, this.password, this.type);

  static List<User> users = [
    User(0, "customer@gmail.com", "customer", "CSC@422", 1),
    User(1, "admin@gmail.com", "admin", "CSC@422", 0)
  ];

  //addAccount

  //editAccount

  //deleteAccount

  static User? findEmailMatch(email) {
    return users.firstWhere((element) => element.email == email);
  }
}
