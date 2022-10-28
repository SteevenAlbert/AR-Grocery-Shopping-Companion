class Product {
  final String? image, title, description;
  final int? price, id;
  Product({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "     Greek Yogurt",
      price: 30,
      description: "Juhayna",
      image: "assets/images/berrries_1.png"),
  Product(
      id: 2,
      title: "     Skimmed Milk",
      price: 50,
      description: "Juhayna",
      image: "assets/images/milk-2.png"),
];
