
class Product {
  final String image, name, producer;
  final int? id, calories;
  final String? servingSize;
  final List<String> ingredients;
  final List<String>? allergyInfo;
  final Map<String, double>? prices;
  final Map<String, Map<String, Object>>? nutrients;
  Product({
    this.id,
    required this.name,
    this.calories,
    this.servingSize,
    required this.image,
    this.prices,
    required this.producer,
    required this.ingredients,
    this.allergyInfo,
    this.nutrients,
  });

  static add(Product newProduct){
    all.add(newProduct);
  }

  static List<Product> all = [
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
      image: "assets/images/greek.png"),
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
      image: "assets/images/milk-1.png"),
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
      image: "assets/images/milk-2.png"),
  Product(
      id: 4,
      name: "Creamy Cheese",
      prices: {
        'Mahmoud Elfar': 45,
        'Mahalawy Sons': 35,
        'Panda': 38,
        'Hyper One': 40
      },
      ingredients: [
        "Pasteurized MILK",
        "Cheese Culture",
        "Salt",
        "Guar gum",
        "Carob Bean Gum"
      ],
      servingSize: 'slice',
      calories: 80,
      nutrients: {
        "FAT": {"amount": 12.51, "unit": "g"},
        "SATFAT": {"amount": 14.51, "unit": "g"},
        "TRANSFAT": {"amount": 0, "unit": "g"},
        "CHOLE": {"amount": 67.51, "unit": "g"},
        "NA": {"amount": 67.51, "unit": "g"},
        "CHOCDF": {"amount": 67.51, "unit": "g"},
        "FIBTG": {"amount": 67.51, "unit": "g"},
        "SUGAR": {"amount": 67.51, "unit": "g"},
        "PROCNT": {"amount": 67.51, "unit": "g"},
      },
      producer: "President",
      image: "assets/images/president.png"),
  Product(
      id: 5,
      name: "Salted Butter",
      prices: {
        'Lulu Market': 50,
        'Ragab Sons': 45,
        'Panda': 48,
        'Hyper One': 47
      },
      ingredients: ["Milk", "Organic Guar Gum", "Vanilla Extract", "Pectin"],
      nutrients: {
        "FAT": {"amount": 67.51, "unit": "g"},
        "SATFAT": {"amount": 67.51, "unit": "g"},
        "TRANSFAT": {"amount": 67.51, "unit": "g"},
        "CHOLE": {"amount": 67.51, "unit": "g"},
        "NA": {"amount": 67.51, "unit": "g"},
        "CHOCDF": {"amount": 67.51, "unit": "g"},
        "FIBTG": {"amount": 67.51, "unit": "g"},
        "SUGAR": {"amount": 67.51, "unit": "g"},
        "PROCNT": {"amount": 67.51, "unit": "g"},
      },
      producer: "Lurpak",
      image: "assets/images/lurpak.png"),
  Product(
      id: 6,
      name: "Lactose-free Milk",
      prices: {'Panda': 30, 'Hyper One': 32},
      producer: "Juhayna",
      ingredients: ["Milk", "Organic Guar Gum", "Vanilla Extract", "Pectin"],
      nutrients: {
        "FAT": {"amount": 67.51, "unit": "g"},
        "SATFAT": {"amount": 67.51, "unit": "g"},
        "TRANSFAT": {"amount": 67.51, "unit": "g"},
        "CHOLE": {"amount": 67.51, "unit": "g"},
        "NA": {"amount": 67.51, "unit": "g"},
        "CHOCDF": {"amount": 67.51, "unit": "g"},
        "FIBTG": {"amount": 67.51, "unit": "g"},
        "SUGAR": {"amount": 67.51, "unit": "g"},
        "PROCNT": {"amount": 67.51, "unit": "g"},
      },
      image: "assets/images/lactose.png"),
];
}


