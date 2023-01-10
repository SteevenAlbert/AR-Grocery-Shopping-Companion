
import 'package:ar_grocery_companion/domain/models/company.dart';
import 'package:ar_grocery_companion/domain/models/product/product.dart';

class ProductBase extends Product{

  ProductBase({
    required int id,
    required String name,
    required String imagePath,
    required Company manufacturer,
  }):super(id: id, name: name, imagePath: imagePath, manufacturer: manufacturer);
}