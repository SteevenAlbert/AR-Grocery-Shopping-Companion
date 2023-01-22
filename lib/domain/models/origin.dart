// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Origin {
  // String id;
  String name;
  String countryCode;

  Origin(
      {
      // required this.id,
      required this.name,
      required this.countryCode});

  Origin copyWith({
    // String? id,
    String? name,
    String? countryCode,
  }) {
    return Origin(
      // id: id ?? this.id,
      name: name ?? this.name,
      countryCode: countryCode ?? this.countryCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'id': id,
      'name': name,
      'countryCode': countryCode,
    };
  }

  factory Origin.fromMap(Map<String, dynamic> map) {
    return Origin(
      // id: map['id'] as String,
      name: map['name'] as String,
      countryCode: map['countryCode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Origin.fromJson(String source) =>
      Origin.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  // String toString() => 'Origin(id: $id, name: $name)';
  String toString() => 'Origin( name: $name,countryCode: $countryCode)';

  @override
  bool operator ==(covariant Origin other) {
    if (identical(this, other)) return true;

    // return other.id == id && other.name == name;
    return other.name == name && other.countryCode == countryCode;
  }

  @override
  // int get hashCode => id.hashCode ^ name.hashCode;
  int get hashCode => name.hashCode ^ countryCode.hashCode;
}
