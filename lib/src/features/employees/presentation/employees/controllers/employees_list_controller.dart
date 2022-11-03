import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_transisi/src/features/employees/application/employees_service.dart';
import 'package:flutter_transisi/src/features/employees/domain/employees_list.dart';

class EmployeesListController extends StateNotifier<AsyncValue<EmployeesList>> {
  EmployeesListController({required this.employeesService})
      : super(AsyncData<EmployeesList>(EmployeesList()));

  final EmployeesService employeesService;

  Future<void> getEmployeesList() async {
    state = const AsyncValue.loading();
    final result = await employeesService.getEmployeesList();
    result.when(
      success: (data) => state = AsyncValue.data(data),
      failure: (error, stacktrace) => state = AsyncError(error, stacktrace),
    );
  }
}

final employeesListControllerProvider = StateNotifierProvider.autoDispose<
        EmployeesListController, AsyncValue<EmployeesList>>(
    (ref) => EmployeesListController(
        employeesService: ref.watch(employeesServiceProvider)));
