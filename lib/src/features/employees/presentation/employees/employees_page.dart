import 'package:flutter/material.dart';
import 'package:flutter_transisi/src/constants/app_sizes.dart';
import 'package:flutter_transisi/src/constants/app_themes.dart';
import 'package:flutter_transisi/src/features/employees/presentation/employees/widgets/employees_list_widget.dart';
import 'package:flutter_transisi/src/routing/routing.dart';
import 'package:go_router/go_router.dart';

class EmployeesPage extends StatelessWidget {
  const EmployeesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const PlaceholderSearchField(
              //   placeholderText: 'What do you want to eat today?',
              // ),
              Gap.h20,
              Text(
                'List of Employees',
                style: AppThemes.headline2,
              ),
              Gap.h20,
              const EmployeesListWidget(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(
            Routes.create.name,
          );
        },
        backgroundColor: AppThemes.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
