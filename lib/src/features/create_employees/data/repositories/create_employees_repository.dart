import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_transisi/src/exceptions/network_exceptions.dart';
import 'package:flutter_transisi/src/features/create_employees/domain/create_employees.dart';
import 'package:flutter_transisi/src/services/network/api_result.dart';
import 'package:flutter_transisi/src/services/network/dio_client.dart';
import 'package:flutter_transisi/src/services/network/endpoints.dart';

class CreateEmployeesRepository {
  final DioClient _dioClient;

  CreateEmployeesRepository(this._dioClient);

  Future<ApiResult<void>> createEmployees(
      {required CreateEmployees createEmployees}) async {
    try {
      await _dioClient.post(
        Endpoints.createUser,
        data: createEmployees.toJson(),
      );
      return const ApiResult.success(null);
    } catch (e, stacktrace) {
      return ApiResult.failure(
        NetworkExceptions.getDioException(e),
        stacktrace,
      );
    }
  }
}

final createEmployeesRepositoryProvider =
    Provider<CreateEmployeesRepository>((ref) {
  return CreateEmployeesRepository(ref.read(dioClientProvider));
});
