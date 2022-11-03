import 'dart:convert';

import 'package:equatable/equatable.dart';

class Employees extends Equatable {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  const Employees({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  })  : id = id ?? 0,
        email = email ?? '',
        firstName = firstName ?? '',
        lastName = lastName ?? '',
        avatar = avatar ?? '';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'avatar': avatar,
    };
  }

  factory Employees.fromMap(Map<String, dynamic> map) {
    return Employees(
      id: map['id'] as int,
      email: map['email'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      avatar: map['avatar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Employees.fromJson(String source) =>
      Employees.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [
        id,
        email,
        firstName,
        lastName,
        avatar,
      ];
}
