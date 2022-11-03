import 'dart:convert';

class CreateEmployees {
  final String name;
  final String job;

  CreateEmployees({String? name, String? job})
      : name = name ?? '',
        job = job ?? '';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'job': job,
    };
  }

  factory CreateEmployees.fromMap(Map<String, dynamic> map) {
    return CreateEmployees(
      name: map['name'] as String,
      job: map['job'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateEmployees.fromJson(String source) =>
      CreateEmployees.fromMap(json.decode(source) as Map<String, dynamic>);
}
