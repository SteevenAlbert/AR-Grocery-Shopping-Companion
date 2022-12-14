// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'country.dart';

class Company {

  String id;
  String name;
  Country? country;
  String? logoPath;
  String? url;

  Company({
    required this.id,
    required this.name,
    this.country,
    this.logoPath,
    this.url,
  });

  Company copyWith({
    String? id,
    String? name,
    Country? country,
    String? logoPath,
    String? url,
  }) {
    return Company(
      id: id ?? this.id,
      name: name ?? this.name,
      country: country ?? this.country,
      logoPath: logoPath ?? this.logoPath,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'country': country?.toMap(),
      'logoPath': logoPath,
      'url': url,
    };
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      id: map['id'] as String,
      name: map['name'] as String,
      country: map['country'] != null ? Country.fromMap(map['country'] as Map<String,dynamic>) : null,
      logoPath: map['logoPath'] != null ? map['logoPath'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Company.fromJson(String source) => Company.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Company(id: $id, name: $name, country: $country, logoPath: $logoPath, url: $url)';
  }

  @override
  bool operator ==(covariant Company other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.country == country &&
      other.logoPath == logoPath &&
      other.url == url;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      country.hashCode ^
      logoPath.hashCode ^
      url.hashCode;
  }

  factory Company.empty() {
    return Company(id: "-1", name: "Nan");
  }
}
