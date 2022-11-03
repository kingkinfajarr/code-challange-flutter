import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_transisi/src/common_widgets/common_widgets.dart';
import 'package:flutter_transisi/src/common_widgets/employees_list_tile.dart';
import 'package:flutter_transisi/src/constants/constants.dart';
import 'package:flutter_transisi/src/constants/keys.dart';
import 'package:flutter_transisi/src/features/employees/domain/employees_list.dart';
import 'package:flutter_transisi/src/features/employees/presentation/employees/controllers/employees_list_controller.dart';
import 'package:flutter_transisi/src/routing/routing.dart';
import 'package:go_router/go_router.dart';

class EmployeesListWidget extends ConsumerStatefulWidget {
  const EmployeesListWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<EmployeesListWidget> createState() => _EmployeesListState();
}

class _EmployeesListState extends ConsumerState<EmployeesListWidget> {
  @override
  void didChangeDependencies() {
    Future.delayed(Duration.zero, () {
      ref.read(employeesListControllerProvider.notifier).getEmployeesList();
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<EmployeesList> employees =
        ref.watch(employeesListControllerProvider);

    return AsyncValueWidget<EmployeesList>(
      value: employees,
      data: (value) {
        if (value.employees.isEmpty) {
          return const Center(
            child: Text('Error'),
          );
        }
        return ListView.builder(
          itemCount: value.employees.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final employee = value.employees[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: Sizes.p20),
              child: GestureDetector(
                onTap: () {
                  context.pushNamed(
                    Routes.detail.name,
                    extra: Extras(
                      extras: {
                        Keys.employeesId: employee.id,
                      },
                    ),
                  );
                },
                child: EmployeesListTile(
                  employees: employee,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
