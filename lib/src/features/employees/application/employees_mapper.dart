import 'package:flutter_transisi/src/features/employees/data/responses/employees_detail_response.dart';
import 'package:flutter_transisi/src/features/employees/data/responses/employees_list_response.dart';
import 'package:flutter_transisi/src/features/employees/domain/employees.dart';
import 'package:flutter_transisi/src/features/employees/domain/employees_detail.dart';
import 'package:flutter_transisi/src/features/employees/domain/employees_list.dart';
import 'package:flutter_transisi/src/services/network/api_result.dart';

class EmployeesMapper {
  static ApiResult<EmployeesList> mapToEmployeesList(
      ApiResult<EmployeesListResponse> response) {
    return response.when(
      success: (data) {
        return ApiResult.success(
          EmployeesList(
            employees: data.employees
                ?.map((item) => Employees(
                      id: item.id,
                      email: item.email,
                      firstName: item.firstName,
                      lastName: item.lastName,
                      avatar: item.avatar,
                    ))
                .toList(),
          ),
        );
      },
      failure: (error, stacktrace) {
        return ApiResult.failure(error, stacktrace);
      },
    );
  }

  static ApiResult<EmployeesDetail> mapToEmployeesDetail(
      ApiResult<EmployeesDetailResponse> response) {
    return response.when(
      success: (data) {
        final employeesDetail = data.employeesDetail;
        return ApiResult.success(
          EmployeesDetail(
            id: employeesDetail?.id,
            email: employeesDetail?.email,
            firstName: employeesDetail?.firstName,
            lastName: employeesDetail?.lastName,
            avatar: employeesDetail?.avatar,
          ),
        );
      },
      failure: (error, stacktrace) {
        return ApiResult.failure(error, stacktrace);
      },
    );
  }
}
