import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_transisi/src/features/create_employees/data/repositories/create_employees_repository.dart';
import 'package:flutter_transisi/src/features/create_employees/domain/create_employees.dart';
import 'package:flutter_transisi/src/services/network/api_result.dart';

class CreateEmployeesService {
  final Ref ref;

  CreateEmployeesService({
    required this.ref,
  });

  Future<ApiResult<void>> createEmployees(
      {required CreateEmployees createEmployees}) async {
    return ref
        .read(createEmployeesRepositoryProvider)
        .createEmployees(createEmployees: createEmployees);
  }
}

final createEmployeesServiceProvider = Provider<CreateEmployeesService>((ref) {
  return CreateEmployeesService(ref: ref);
});
