import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_transisi/src/features/create_employees/presentation/create_employees/controllers/create_employees_controller.dart';
import 'package:flutter_transisi/src/features/create_employees/presentation/create_employees/widgets/create_employees_widget.dart';

class CreateEmployeesPage extends ConsumerStatefulWidget {
  const CreateEmployeesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateEmployeesPageState();
}

class _CreateEmployeesPageState extends ConsumerState<CreateEmployeesPage> {
  @override
  Widget build(BuildContext context) {
    final asyncValueCreateEmployees =
        ref.watch(createEmployeesControllerProvider);
    // ref.listen<AsyncValue<void>>(createEmployeesControllerProvider, ((previous, next) {
    //   next.maybeWhen(
    //     data: (data) {
    //       ref.read(provider)
    //     }
    //   )
    // }))
    return CreateEmployeesWidget();
  }
}
