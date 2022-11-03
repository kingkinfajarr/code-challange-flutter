import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_transisi/src/constants/app_sizes.dart';
import 'package:flutter_transisi/src/constants/constants.dart';
import 'package:flutter_transisi/src/features/create_employees/presentation/create_employees/controllers/create_employees_controller.dart';
import 'package:flutter_transisi/src/features/employees/presentation/employees/controllers/employees_list_controller.dart';
import 'package:flutter_transisi/src/helper/snackbar_helper.dart';

class CreateEmployeesWidget extends ConsumerWidget {
  const CreateEmployeesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(
      createEmployeesControllerProvider,
      (previous, next) {
        next.maybeWhen(
          data: (data) {
            ref
                .read(employeesListControllerProvider.notifier)
                .getEmployeesList();
            Navigator.of(context).pop();
            showSuccessSnackbar(context, 'Success Add Employees!');
          },
          orElse: (() {}),
        );
      },
    );
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.p16,
            vertical: Sizes.p16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Employees',
                style: AppThemes.headline2,
              ),
              Gap.h20,
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Sizes.p20),
                    borderSide: const BorderSide(
                      width: 1,
                      style: BorderStyle.none,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: Sizes.p16, vertical: Sizes.p12),
                  hintText: 'Input your name...',
                  hintStyle: AppThemes.text2,
                ),
                onChanged: ((value) {
                  ref
                      .read(createEmployeesControllerProvider.notifier)
                      .changedName(value);
                }),
              ),
              Gap.h12,
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Sizes.p20),
                    borderSide: const BorderSide(
                      width: 1,
                      style: BorderStyle.none,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: Sizes.p16, vertical: Sizes.p12),
                  hintText: 'Input your job...',
                  hintStyle: AppThemes.text2,
                ),
                onChanged: ((value) {
                  ref
                      .read(createEmployeesControllerProvider.notifier)
                      .changedJob(value);
                }),
              ),
              Gap.h12,
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppThemes.green,
                      ),
                      onPressed: () {
                        ref
                            .read(createEmployeesControllerProvider.notifier)
                            .createEmployees();
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
