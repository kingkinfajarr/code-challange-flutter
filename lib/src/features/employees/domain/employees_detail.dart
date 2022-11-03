import 'package:equatable/equatable.dart';

class EmployeesDetail extends Equatable {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  const EmployeesDetail({
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

  @override
  List<Object?> get props => [
        id,
        email,
        firstName,
        lastName,
        avatar,
      ];
}
