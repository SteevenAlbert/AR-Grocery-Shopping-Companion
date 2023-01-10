import 'package:ar_grocery_companion/models/category.dart';

class Product {
  String image, name, producer;
  final int? id, calories;
  final String servingSize;
  final List<String> ingredients;
  final List<String>? allergyInfo;
  final Map<String, String> prices;
  final Map<String, String>? URLs;
  final Map<String, Map<String, Object>>? nutrients;
  final Category? category;
  Product({
    this.id,
    required this.name,
    this.calories,
    required this.servingSize,
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

  static Product? retrieveProduct(productId) {
    return all.firstWhere((product) => product.id == productId);
  }

  static List<Product> all = [
    Product(
        id: 1,
        name: "Greek Yogurt",
        prices: {
          'Amazon': "20",
          'Noon': "35",
          'Jumia': "25",
          'Carrefour': "22"
        },
        URLs: {
          'Amazon': "https://www.amazon.eg/",
          'Noon': "https://www.noon.com/egypt-en/",
          'Jumia': "https://www.jumia.com/",
          'Carrefour': "https://www.carrefouregypt.com/",
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
        category: Category.all[1]),
    Product(
        id: 2,
        name: "Skimmed Milk",
        servingSize: '200ml',
        calories: 20,
        ingredients: ["Non-fat Milk", "Vitamin A Palmitate", "VVitamin D3"],
        prices: {
          'Noon': "45",
          'Amazon': "30",
          'Jumia': "38",
          'Carrefour': "40"
        },
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
          'Amazon': "https://www.amazon.eg/",
          'Noon': "https://www.noon.com/egypt-en/",
          'Jumia': "https://www.jumia.com/",
          'Carrefour': "https://www.carrefouregypt.com/",
        },
        producer: "Juhayna",
        image: "assets/images/milk-1.png",
        category: Category.all[1]),
    Product(
        id: 3,
        name: "Gardino Tomato Sauce",
        servingSize: '10g',
        calories: 30,
        ingredients: ["Tomatoes", "Salt", "Vanilla Extract"],
        prices: {
          'Noon': "25",
          'Amazon': "23",
          'Jumia': "22",
          'Carrefour': "21"
        },
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
          'Amazon':
              "https://www.amazon.eg/-/en/Gardino-Tomato-Sauce-380-gm/dp/B07VSX3HV7?ref_=Oct_d_obs_d_21840401031&pd_rd_w=O2szN&content-id=amzn1.sym.3dfd202c-0419-4dc2-a7f1-f3fc9bea0ba1&pf_rd_p=3dfd202c-0419-4dc2-a7f1-f3fc9bea0ba1&pf_rd_r=YFHDGEPA0J8GGXGF71GM&pd_rd_wg=QPz6W&pd_rd_r=c0e640bc-4202-4218-a779-1cd696090940&pd_rd_i=B07VSX3HV7",
          'Noon': "https://www.noon.com/egypt-en/",
          'Jumia':
              "https://www.jumia.com.eg/tomato-paste-can-380g-giardino-mpg862656.html",
          'Carrefour': "https://www.carrefouregypt.com/",
        },
        producer: "Gardino",
        image: "assets/images/gardino.jpg",
        category: Category.all[2]),
    Product(
        id: 4,
        name: "Creamy Cheese",
        prices: {
          'Amazon': "45",
          'Noon': "35",
          'Jumia': "38",
          'Carrefour': "40"
        },
        ingredients: [
          "Pasteurized MILK",
          "Cheese Culture",
          "Salt",
          "Guar gum",
          "Carob Bean Gum"
        ],
        servingSize: '8pcs',
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
          'Amazon': "https://www.amazon.eg/",
          'Noon': "https://www.noon.com/egypt-en/",
          'Jumia': "https://www.jumia.com/",
          'Carrefour': "https://www.carrefouregypt.com/",
        },
        producer: "President",
        image: "assets/images/president.png",
        category: Category.all[2]),
    Product(
        id: 5,
        name: "Salted Butter",
        prices: {
          'Noon': "50",
          'Amazon': "45",
          'Jumia': "48",
          'Carrefour': "47"
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
        servingSize: '0.25Kg',
        URLs: {
          'Amazon': "https://www.amazon.eg/",
          'Noon': "https://www.noon.com/egypt-en/",
          'Jumia': "https://www.jumia.com/",
          'Carrefour': "https://www.carrefouregypt.com/",
        },
        producer: "Lurpak",
        image: "assets/images/lurpak.png",
        category: Category.all[3]),
    Product(
        id: 6,
        name: "Lact-free Milk",
        prices: {
          'Noon': "30",
          'Amazon': "35",
          'Jumia': "30",
          'Carrefour': "32"
        },
        producer: "Juhayna",
        ingredients: ["Milk", "Organic Guar Gum", "Vanilla Extract", "Pectin"],
        URLs: {
          'Amazon': "https://www.amazon.eg/",
          'Noon': "https://www.noon.com/egypt-en/",
          'Jumia': "https://www.jumia.com/",
          'Carrefour': "https://www.carrefouregypt.com/",
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
        servingSize: '100ml',
        image: "assets/images/lactose.png",
        category: Category.all[3]),
    Product(
        id: 7,
        name: "Ripe Strawberry",
        servingSize: '1Kg',
        calories: 20,
        ingredients: ["Non-fat Milk", "Vitamin A Palmitate", "VVitamin D3"],
        prices: {
          'Noon': "45",
          'Amazon': "30",
          'Jumia': "38",
          'Carrefour': "40"
        },
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
          'Amazon': "https://www.amazon.eg/",
          'Noon': "https://www.noon.com/egypt-en/",
          'Jumia': "https://www.jumia.com/",
          'Carrefour': "https://www.carrefouregypt.com/",
        },
        producer: "Juhayna",
        image: "assets/images/strawberry.png",
        category: Category.all[5]),
    Product(
        id: 8,
        name: "Bueno",
        servingSize: '2bars',
        calories: 20,
        ingredients: ["Non-fat Milk", "Vitamin A Palmitate", "VVitamin D3"],
        prices: {
          'Noon': "45",
          'Amazon': "30",
          'Jumia': "38",
          'Carrefour': "40"
        },
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
          'Amazon': "https://www.amazon.eg/",
          'Noon': "https://www.noon.com/egypt-en/",
          'Jumia': "https://www.jumia.com/",
          'Carrefour': "https://www.carrefouregypt.com/",
        },
        producer: "Juhayna",
        image: "assets/images/kinder_bueno_6sticks.png",
        category: Category.all[5]),
    Product(
        id: 9,
        name: "Skimmed Milk",
        servingSize: '200ml',
        calories: 20,
        ingredients: ["Non-fat Milk", "Vitamin A Palmitate", "VVitamin D3"],
        prices: {
          'Noon': "45",
          'Amazon': "30",
          'Jumia': "38",
          'Carrefour': "40"
        },
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
          'Amazon': "https://www.amazon.eg/",
          'Noon': "https://www.noon.com/egypt-en/",
          'Jumia': "https://www.jumia.com/",
          'Carrefour': "https://www.carrefouregypt.com/",
        },
        producer: "Juhayna",
        image: "assets/images/milk-1.png",
        category: Category.all[5]),
    Product(
        id: 10,
        name: "Cadbury",
        servingSize: '10gr',
        calories: 20,
        ingredients: ["Non-fat Milk", "Vitamin A Palmitate", "VVitamin D3"],
        prices: {
          'Noon': "45",
          'Amazon': "30",
          'Jumia': "38",
          'Carrefour': "40"
        },
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
          'Amazon': "https://www.amazon.eg/",
          'Noon': "https://www.noon.com/egypt-en/",
          'Jumia': "https://www.jumia.com/",
          'Carrefour': "https://www.carrefouregypt.com/",
        },
        producer: "Juhayna",
        image: "assets/images/cadbury.png",
        category: Category.all[5]),
    Product(
        id: 11,
        name: "Skimmed Milk",
        servingSize: '200ml',
        calories: 20,
        ingredients: ["Non-fat Milk", "Vitamin A Palmitate", "VVitamin D3"],
        prices: {
          'Noon': "45",
          'Amazon': "30",
          'Jumia': "38",
          'Carrefour': "40"
        },
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
          'Amazon': "https://www.amazon.eg/",
          'Noon': "https://www.noon.com/egypt-en/",
          'Jumia': "https://www.jumia.com/",
          'Carrefour': "https://www.carrefouregypt.com/",
        },
        producer: "Juhayna",
        image: "assets/images/milk-1.png",
        category: Category.all[6]),
    Product(
        id: 12,
        name: "Skimmed Milk",
        servingSize: '200ml',
        calories: 20,
        ingredients: ["Non-fat Milk", "Vitamin A Palmitate", "VVitamin D3"],
        prices: {
          'Noon': "45",
          'Amazon': "30",
          'Jumia': "38",
          'Carrefour': "40"
        },
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
          'Amazon': "https://www.amazon.eg/",
          'Noon': "https://www.noon.com/egypt-en/",
          'Jumia': "https://www.jumia.com/",
          'Carrefour': "https://www.carrefouregypt.com/",
        },
        producer: "Juhayna",
        image: "assets/images/milk-1.png",
        category: Category.all[6]),
  ];
}
