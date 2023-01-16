class AppUser {
  String? email;
  int? type;
  String? name;
  //TODO: date_of_birth
  //TODO: gender
  //TODO: image

  AppUser({this.email, this.name, this.type});

  static List<AppUser> appUsers = [
    AppUser(email: "customer@gmail.com", name: "customer", type: 1),
    AppUser(email: "admin@gmail.com", name: "admin", type: 0)
  ];

  //addAccount

  //editAccount

  //deleteAccount

  static AppUser findEmailMatch(email) {
    return appUsers.firstWhere((element) => element.email == email);
  }
}
