import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_transisi/src/features/create_employees/application/create_employees_service.dart';
import 'package:flutter_transisi/src/features/create_employees/domain/create_employees.dart';

class CreateEmployeesController extends StateNotifier<AsyncValue<void>> {
  CreateEmployeesController({required this.createEmployeesService})
      : super(const AsyncData<void>(null));

  final CreateEmployeesService createEmployeesService;

  String _name = '';
  String _job = '';

  void changedName(String? value) {
    _name = value ?? '';
  }

  void changedJob(String? value) {
    _job = value ?? '';
  }

  Future<void> createEmployees() async {
    state = const AsyncValue.loading();
    final createEmployees = CreateEmployees(
      name: _name,
      job: _job,
    );
    final result = await createEmployeesService.createEmployees(
        createEmployees: createEmployees);
    result.when(
      success: (data) => state = AsyncValue.data(data),
      failure: (error, stacktrace) => state = AsyncError(error, stacktrace),
    );
  }
}

final createEmployeesControllerProvider = StateNotifierProvider.autoDispose<
        CreateEmployeesController, AsyncValue<void>>(
    (ref) => CreateEmployeesController(
        createEmployeesService: ref.watch(createEmployeesServiceProvider)));
