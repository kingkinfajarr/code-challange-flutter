import 'package:equatable/equatable.dart';
import 'package:flutter_transisi/src/features/employees/domain/employees.dart';

class EmployeesList extends Equatable {
  final List<Employees> employees;

  EmployeesList({
    List<Employees>? employees,
  }) : employees = employees ?? [];

  @override
  List<Object?> get props => [employees];
}
