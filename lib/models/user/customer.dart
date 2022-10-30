import 'package:ar_grocery_companion/models/product.dart';
import 'package:ar_grocery_companion/models/category.dart';
import 'user.dart';

class Customer extends User {
  Customer(int id, String email, String username, String password)
      : super(id, email, username, password, 0);

  static List<Product>? favourites = [
    Product(
        id: 1,
        name: "Greek Yogurt",
        prices: {'Ragab Sons': 20, 'Oscar': 35, 'Panda': 25, 'Hyper One': 22},
        calories: 40,
        ingredients: ["Milk", "Organic Guar Gum", "Vanilla Extract", "Pectin"],
        servingSize: '60g',
        nutrients: {
          "FAT": {"amount": 7, "unit": "g"},
          "SATFAT": {"amount": 5, "unit": "g"},
          "TRANSFAT": {"amount": 2, "unit": "g"},
          "CHOLE": {"amount": 67.51, "unit": "g"},
          "NA": {"amount": 67.51, "unit": "g"},
          "CHOCDF": {"amount": 67.51, "unit": "g"},
          "FIBTG": {"amount": 67.51, "unit": "g"},
          "SUGAR": {"amount": 67.51, "unit": "g"},
          "PROCNT": {"amount": 67.51, "unit": "g"},
        },
        producer: "Juhayna",
        image: "assets/images/greek.png",
        category: Category.all[0]),
    Product(
        id: 2,
        name: "Skimmed Milk",
        servingSize: '200ml',
        calories: 20,
        ingredients: ["Non-fat Milk", "Vitamin A Palmitate", "VVitamin D3"],
        prices: {'Gourmet': 45, 'Ragab Sons': 30, 'Panda': 38, 'Hyper One': 40},
        nutrients: {
          "FAT": {"amount": 12.51, "unit": "g"},
          "SATFAT": {"amount": 4.51, "unit": "g"},
          "TRANSFAT": {"amount": 0, "unit": "g"},
          "CHOLE": {"amount": 6.51, "unit": "mg"},
          "NA": {"amount": 67.51, "unit": "g"},
          "CHOCDF": {"amount": 67.51, "unit": "g"},
          "FIBTG": {"amount": 67.51, "unit": "g"},
          "SUGAR": {"amount": 67.51, "unit": "g"},
          "PROCNT": {"amount": 67.51, "unit": "g"},
        },
        producer: "Juhayna",
        image: "assets/images/milk-1.png",
        category: Category.all[0]),
    Product(
        id: 3,
        name: "Full Cream Milk",
        servingSize: '200ml',
        calories: 30,
        ingredients: ["Milk", "Organic Guar Gum", "Vanilla Extract", "Pectin"],
        prices: {'Oscar': 25, 'Ragab Sons': 23, 'Panda': 22, 'Hyper One': 21},
        nutrients: {
          "FAT": {"amount": 67.51, "unit": "g"},
          "SATFAT": {"amount": 2.51, "unit": "g"},
          "TRANSFAT": {"amount": 0, "unit": "g"},
          "CHOLE": {"amount": 67.51, "unit": "g"},
          "NA": {"amount": 67.51, "unit": "g"},
          "CHOCDF": {"amount": 67.51, "unit": "g"},
          "FIBTG": {"amount": 67.51, "unit": "g"},
          "SUGAR": {"amount": 67.51, "unit": "g"},
          "PROCNT": {"amount": 67.51, "unit": "g"},
        },
        producer: "Juhayna",
        image: "assets/images/milk-2.png",
        category: Category.all[0]),
  ];

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
