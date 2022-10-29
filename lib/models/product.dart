class Product {
  final String? image, name, producer;
  final int? id;
  final Map<String, double>? prices;

  Product({
    this.id,
    this.image,
    this.name,
    this.prices,
    this.producer,
  });
}

List<Product> products = [
  Product(
      id: 1,
      name: "Greek Yogurt",
      prices: {'Ragab Sons': 20, 'Oscar': 35, 'Panda': 25, 'Hyper One': 22},
      producer: "Juhayna",
      image: "images/greek.png"),
  Product(
      id: 2,
      name: "Skimmed Milk",
      prices: {'Gourmet': 45, 'Ragab Sons': 30, 'Panda': 38, 'Hyper One': 40},
      producer: "Juhayna",
      image: "images/milk-1.png"),
  Product(
      id: 3,
      name: "Full Cream Milk",
      prices: {'Oscar': 25, 'Ragab Sons': 23, 'Panda': 22, 'Hyper One': 21},
      producer: "Juhayna",
      image: "images/milk-2.png"),
  Product(
      id: 4,
      name: "Creamy Cheese",
      prices: {
        'Mahmoud Elfar': 45,
        'Mahalawy Sons': 35,
        'Panda': 38,
        'Hyper One': 40
      },
      producer: "President",
      image: "images/president.png"),
  Product(
      id: 5,
      name: "Salted Butter",
      prices: {
        'Lulu Market': 50,
        'Ragab Sons': 45,
        'Panda': 48,
        'Hyper One': 47
      },
      producer: "Lurpak",
      image: "images/lurpak.png"),
  Product(
      id: 6,
      name: "Lactose-free Milk",
      prices: {'Panda': 30, 'Hyper One': 32},
      producer: "Juhayna",
      image: "images/lactose.png"),
];
