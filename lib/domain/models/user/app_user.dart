// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AppUser {
  String UID;
  String email;
  String type;
  String name;
  String DOB;
  String gender;
  String? pfpPath = "assets/images/profilepic.jpeg";

  AppUser(
      {required this.UID,
      required this.email,
      required this.type,
      required this.name,
      required this.DOB,
      required this.gender,
      this.pfpPath});

  AppUser copyWith({
    required String UID,
    required String email,
    required String type,
    required String name,
    required String DOB,
    required String gender,
    String? pfpPath,
  }) {
    return AppUser(
      UID: this.UID,
      email: this.email,
      type: this.type,
      name: this.name,
      DOB: this.DOB,
      gender: this.gender,
      pfpPath: pfpPath ?? this.pfpPath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'type': type,
      'name': name,
      'DOB': DOB,
      'gender': gender,
      'pfpPath': pfpPath,
    };
  }

  static String path(UID) {
    return '/-' + UID;
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      UID: map['UID'] as String,
      email: map['email'] as String,
      type: map['type'] as String,
      name: map['name'] as String,
      DOB: map['DOB'] as String,
      gender: map['gender'] as String,
      pfpPath: map['pfpPath'],
    );
  }

  factory AppUser.fromJson(String source, value) =>
      AppUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AppUser(UID: $UID,email: $email, type: $type, name: $name, DOB: $DOB, gender: $gender, pfpPath: $pfpPath)';
  }

  @override
  bool operator ==(covariant AppUser other) {
    if (identical(this, other)) return true;

    return other.UID == UID &&
        other.email == email &&
        other.type == type &&
        other.name == name &&
        other.DOB == DOB &&
        other.gender == gender &&
        other.pfpPath == pfpPath;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        type.hashCode ^
        name.hashCode ^
        DOB.hashCode ^
        gender.hashCode ^
        pfpPath.hashCode;
  }
}
