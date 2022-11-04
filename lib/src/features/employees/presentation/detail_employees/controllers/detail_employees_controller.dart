import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_transisi/src/features/employees/application/employees_service.dart';
import 'package:flutter_transisi/src/features/employees/domain/employees_detail.dart';

class DetailEmployeesController
    extends StateNotifier<AsyncValue<EmployeesDetail>> {
  DetailEmployeesController({required this.employeesService})
      : super(const AsyncLoading());

  final EmployeesService employeesService;

  Future<void> getEmployeesById({required int id}) async {
    state = const AsyncValue.loading();
    final result = await employeesService.getEmployeesDetail(id: id);
    result.when(
      success: (data) => state = AsyncValue.data(data),
      failure: (error, stacktrace) => state = AsyncError(error, stacktrace),
    );
  }
}

final detailEmployeesControllerProvider = StateNotifierProvider.autoDispose<
        DetailEmployeesController, AsyncValue<EmployeesDetail>>(
    (ref) => DetailEmployeesController(
        employeesService: ref.watch(employeesServiceProvider)));
