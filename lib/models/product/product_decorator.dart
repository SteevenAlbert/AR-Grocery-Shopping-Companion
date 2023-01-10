import 'package:ar_grocery_companion/models/product/product.dart';

abstract class ProductDecorator extends Product {
  
  Product product;

  ProductDecorator({
    required this.product,
  }):super(id: product.id, name: product.name, imagePath: product.imagePath, manufacturer: product.manufacturer);

  @override
  String toString() => 'ProductDecorator(product: $product)';

  @override
  bool operator ==(covariant ProductDecorator other) {
    if (identical(this, other)) return true;
  
    return 
      other.product == product;
  }

  @override
  int get hashCode => product.hashCode;
}
