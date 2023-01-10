// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductCategory {

  int? id;
  String name;
  String? imagePath;

  ProductCategory({
    this.id,
    required this.name,
    this.imagePath,
  });
  
  ProductCategory copyWith({
    int? id,
    String? name,
    String? imagePath,
  }) {
    return ProductCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'imagePath': imagePath,
    };
  }

  factory ProductCategory.fromMap(Map<String, dynamic> map) {
    return ProductCategory(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      imagePath: map['imagePath'] != null ? map['imagePath'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductCategory.fromJson(String source) => ProductCategory.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Category(id: $id, name: $name, imagePath: $imagePath)';

  @override
  bool operator ==(covariant ProductCategory other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.imagePath == imagePath;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ imagePath.hashCode;

  static add(ProductCategory newCategory){
    all.add(newCategory);
  }

  static List<ProductCategory> all = <ProductCategory>[
  ];

}
