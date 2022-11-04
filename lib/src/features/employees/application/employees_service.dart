import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_transisi/src/features/employees/application/employees_mapper.dart';
import 'package:flutter_transisi/src/features/employees/data/repositories/employees_repository.dart';
import 'package:flutter_transisi/src/features/employees/domain/employees_detail.dart';
import 'package:flutter_transisi/src/features/employees/domain/employees_list.dart';
import 'package:flutter_transisi/src/services/network/api_result.dart';

class EmployeesService {
  final Ref ref;

  EmployeesService({
    required this.ref,
  });

  Future<ApiResult<EmployeesList>> getEmployeesList() async {
    final employeesList =
        await ref.read(employeesRepositoryProvider).getEmployeesList();
    return EmployeesMapper.mapToEmployeesList(employeesList);
  }

  Future<ApiResult<EmployeesDetail>> getEmployeesDetail(
      {required int id}) async {
    final employeesDetail =
        await ref.read(employeesRepositoryProvider).getEmployeesDetail(id: id);
    return EmployeesMapper.mapToEmployeesDetail(employeesDetail);
  }
}

final employeesServiceProvider = Provider<EmployeesService>((ref) {
  return EmployeesService(
    ref: ref,
  );
});
