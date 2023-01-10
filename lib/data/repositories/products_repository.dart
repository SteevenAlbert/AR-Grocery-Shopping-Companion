import 'package:ar_grocery_companion/domain/models/company.dart';
import 'package:ar_grocery_companion/domain/models/product/concrete_products/food_product.dart';
import 'package:ar_grocery_companion/domain/models/product/product.dart';
import 'package:ar_grocery_companion/domain/models/product/product_base.dart';

class ProductsRepository{
  static List<Product> queryAllDummyData(){
    List<Product> list = [];
    for (int i =0; i < 20; i++)
    {
      ProductBase productBase = ProductBase(id: i, name: "name $i", imagePath: "assets/images/milk-1.png", manufacturer: Company(name: "company $i"));
      FoodProduct foodProduct = FoodProduct(product: productBase);
      list.add(foodProduct);
    }

    return list;
  }

  static Product retrieveProduct(int id){
    return queryAllDummyData().firstWhere((Product element) => element.id == id);
  }
}