// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CustomCategory {

  String id;
  String name;
  String? imagePath;

  CustomCategory({
    required this.id,
    required this.name,
    this.imagePath,
  });

  CustomCategory copyWith({
    String? id,
    String? name,
    String? imagePath,
  }) {
    return CustomCategory(
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

  factory CustomCategory.fromMap(Map<String, dynamic> map) {
    return CustomCategory(
      id: map['id'] as String,
      name: map['name'] as String,
      imagePath: map['imagePath'] != null ? map['imagePath'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomCategory.fromJson(String source) => CustomCategory.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProductCategory(id: $id, name: $name, imagePath: $imagePath)';

  @override
  bool operator ==(covariant CustomCategory other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.imagePath == imagePath;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ imagePath.hashCode;

  // TODO: remove all list
  static List<CustomCategory> all = [];

  factory CustomCategory.empty() {
    return CustomCategory(id: "-1", name: "Nan");
  }
}
