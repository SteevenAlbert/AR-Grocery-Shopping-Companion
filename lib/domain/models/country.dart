// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Country {
  int id;
  String name;

  Country({
    required this.id,
    required this.name,
  });
  
  Country copyWith({
    int? id,
    String? name,
  }) {
    return Country(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Country.fromJson(String source) => Country.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Country(id: $id, name: $name)';

  @override
  bool operator ==(covariant Country other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
