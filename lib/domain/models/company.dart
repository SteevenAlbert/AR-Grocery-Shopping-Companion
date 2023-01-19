// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'origin.dart';

class Company {
  String id;
  String name;
  Origin? origin;
  String? logoPath;
  String? url;
  List<String>? products;
  Company({
    required this.id,
    required this.name,
    this.origin,
    this.logoPath,
    this.url,
    this.products,
  });

  factory Company.empty() {
    return Company(id: "-1", name: "Nan");
  }

  Company copyWith({
    String? id,
    String? name,
    Origin? origin,
    String? logoPath,
    String? url,
    List<String>? products,
  }) {
    return Company(
      id: id ?? this.id,
      name: name ?? this.name,
      origin: origin ?? this.origin,
      logoPath: logoPath ?? this.logoPath,
      url: url ?? this.url,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'origin': origin?.toMap(),
      'logoPath': logoPath,
      'url': url,
      'products': products,
    };
  }

  Map<String, dynamic> toMap2() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'origin': origin?.toMap(),
      'logoPath': logoPath,
      'url': url,
    };
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      id: map['id'] as String,
      name: map['name'] as String,
      origin: map['origin'] != null
          ? Origin.fromMap(map['origin'] as Map<String, dynamic>)
          : null,
      logoPath: map['logoPath'] != null ? map['logoPath'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      products: map['products'] != null
          ? List<String>.from((map['products'] as List))
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory Company.fromJson(String source) =>
      Company.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Company(id: $id, name: $name, origin: $origin, logoPath: $logoPath, url: $url, products: $products)';
  }

  @override
  bool operator ==(covariant Company other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.origin == origin &&
        other.logoPath == logoPath &&
        other.url == url &&
        listEquals(other.products, products);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        origin.hashCode ^
        logoPath.hashCode ^
        url.hashCode ^
        products.hashCode;
  }
}
