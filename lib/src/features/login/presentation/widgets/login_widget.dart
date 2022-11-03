import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_transisi/src/constants/constants.dart';
import 'package:flutter_transisi/src/features/employees/presentation/employees/employees_page.dart';
import 'package:flutter_transisi/src/features/login/presentation/controllers/login_controller.dart';
import 'package:flutter_transisi/src/helper/snackbar_helper.dart';
import 'package:flutter_transisi/src/routing/app_routes.dart';

class LoginWidget extends ConsumerWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(
      loginAuthControllerProvider,
      (previous, next) {
        next.maybeWhen(
          data: (data) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EmployeesPage(),
              ),
            );
            showSuccessSnackbar(context, 'Login Success');
          },
          error: (e, stacktrace) {
            return showErrorSnackbar(
              context,
              'Login Gagal, Email atau Password tidak cocok',
            );
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login Page',
                style: AppThemes.headline1,
              ),
              Gap.h28,
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
                  hintText: 'Input your email...',
                  hintStyle: AppThemes.text2,
                ),
                onChanged: ((value) {
                  ref
                      .read(loginAuthControllerProvider.notifier)
                      .changedEmail(value);
                }),
              ),
              Gap.h12,
              TextField(
                obscureText: true,
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
                  hintText: 'Input your password...',
                  hintStyle: AppThemes.text2,
                ),
                onChanged: ((value) {
                  ref
                      .read(loginAuthControllerProvider.notifier)
                      .changedPassword(value);
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
                        ref.read(loginAuthControllerProvider.notifier).login();
                      },
                      child: const Text('Login'),
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
