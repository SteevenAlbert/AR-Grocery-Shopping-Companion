import 'package:ar_grocery_companion/models/category.dart';

class Product {
   String image, name, producer;
  final int? id, calories;
  final String? servingSize;
  final List<String> ingredients;
  final List<String>? allergyInfo;
  final Map<String, double> prices;
  final Map<String, Uri>? URLs;
  final Map<String, Map<String, Object>>? nutrients;
  final Category? category;
  Product({
    this.id,
    required this.name,
    this.calories,
    this.servingSize,
    required this.image,
    required this.prices,
    required this.producer,
    required this.ingredients,
    this.allergyInfo,
    this.nutrients,
    this.URLs,
    this.category,
  });

  static add(Product newProduct) {
    all.add(newProduct);
  }

  static remove(Product product) {
    all.remove(product);
  }

  static List<Product> all = [
    Product(
        id: 1,
        name: "Greek Yogurt",
        prices: {'Amazon': 20, 'Noon': 35, 'Jumia': 25, 'Carrefour': 22},
        URLs: {
          'Amazon': Uri.parse("https://www.amazon.eg/"),
          'Noon': Uri.parse("https://www.noon.com/egypt-en/"),
          'Jumia': Uri.parse("https://www.jumia.com/"),
          'Carrefour': Uri.parse("https://www.carrefouregypt.com/"),
        },
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
        prices: {'Noon': 45, 'Amazon': 30, 'Jumia': 38, 'Carrefour': 40},
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
        URLs: {
          'Amazon': Uri.parse("https://www.amazon.eg/"),
          'Noon': Uri.parse("https://www.noon.com/egypt-en/"),
          'Jumia': Uri.parse("https://www.jumia.com/"),
          'Carrefour': Uri.parse("https://www.carrefouregypt.com/"),
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
        prices: {'Noon': 25, 'Amazon': 23, 'Jumia': 22, 'Carrefour': 21},
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
        URLs: {
          'Amazon': Uri.parse("https://www.amazon.eg/"),
          'Noon': Uri.parse("https://www.noon.com/egypt-en/"),
          'Jumia': Uri.parse("https://www.jumia.com/"),
          'Carrefour': Uri.parse("https://www.carrefouregypt.com/"),
        },
        producer: "Juhayna",
        image: "assets/images/milk-2.png",
        category: Category.all[0]),
    Product(
        id: 4,
        name: "Creamy Cheese",
        prices: {
          'Mahmoud Elfar': 45,
          'Mahalawy Sons': 35,
          'Jumia': 38,
          'Carrefour': 40
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
        URLs: {
          'Amazon': Uri.parse("https://www.amazon.eg/"),
          'Noon': Uri.parse("https://www.noon.com/egypt-en/"),
          'Jumia': Uri.parse("https://www.jumia.com/"),
          'Carrefour': Uri.parse("https://www.carrefouregypt.com/"),
        },
        producer: "President",
        image: "assets/images/president.png",
        category: Category.all[0]),
    Product(
        id: 5,
        name: "Salted Butter",
        prices: {'Noon': 50, 'Amazon': 45, 'Jumia': 48, 'Carrefour': 47},
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
        URLs: {
          'Amazon': Uri.parse("https://www.amazon.eg/"),
          'Noon': Uri.parse("https://www.noon.com/egypt-en/"),
          'Jumia': Uri.parse("https://www.jumia.com/"),
          'Carrefour': Uri.parse("https://www.carrefouregypt.com/"),
        },
        producer: "Lurpak",
        image: "assets/images/lurpak.png",
        category: Category.all[0]),
    Product(
        id: 6,
        name: "Lact-free Milk",
        prices: {'Noon': 30, 'Amazon': 35, 'Jumia': 30, 'Carrefour': 32},
        producer: "Juhayna",
        ingredients: ["Milk", "Organic Guar Gum", "Vanilla Extract", "Pectin"],
        URLs: {
          'Amazon': Uri.parse("https://www.amazon.eg/"),
          'Noon': Uri.parse("https://www.noon.com/egypt-en/"),
          'Jumia': Uri.parse("https://www.jumia.com/"),
          'Carrefour': Uri.parse("https://www.carrefouregypt.com/"),
        },
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
        image: "assets/images/lactose.png",
        category: Category.all[0]),
  ];
}
