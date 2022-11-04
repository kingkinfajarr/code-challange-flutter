import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_transisi/src/exceptions/network_exceptions.dart';
import 'package:flutter_transisi/src/features/employees/data/responses/employees_detail_response.dart';
import 'package:flutter_transisi/src/features/employees/data/responses/employees_list_response.dart';
import 'package:flutter_transisi/src/services/network/api_result.dart';
import 'package:flutter_transisi/src/services/network/dio_client.dart';
import 'package:flutter_transisi/src/services/network/endpoints.dart';

class EmployeesRepository {
  final DioClient _dioClient;

  EmployeesRepository(this._dioClient);

  Future<ApiResult<EmployeesListResponse>> getEmployeesList() async {
    try {
      final response = await _dioClient.get(Endpoints.listUser);
      return ApiResult.success(EmployeesListResponse.fromJson(response));
    } catch (e, stacktrace) {
      return ApiResult.failure(
        NetworkExceptions.getDioException(e),
        stacktrace,
      );
    }
  }

  Future<ApiResult<EmployeesDetailResponse>> getEmployeesDetail(
      {required int id}) async {
    try {
      final response = await _dioClient.get("${Endpoints.detailUser}$id");
      return ApiResult.success(EmployeesDetailResponse.fromJson(response));
    } catch (e, stacktrace) {
      return ApiResult.failure(
        NetworkExceptions.getDioException(e),
        stacktrace,
      );
    }
  }
}

final employeesRepositoryProvider = Provider<EmployeesRepository>((ref) {
  return EmployeesRepository(ref.read(dioClientProvider));
});
