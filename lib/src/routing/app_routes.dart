import 'package:flutter/material.dart';
import 'package:flutter_transisi/src/constants/keys.dart';
import 'package:flutter_transisi/src/features/create_employees/presentation/create_employees/create_employees_page.dart';
import 'package:flutter_transisi/src/features/employees/presentation/detail_employees/detail_employees_page.dart';
import 'package:flutter_transisi/src/features/employees/presentation/employees/employees_page.dart';
import 'package:flutter_transisi/src/features/login/presentation/login_page.dart';
import 'package:go_router/go_router.dart';

import 'routing.dart';

enum Routes {
  login,
  home,
  detail,
  create,
}

final goRouter = GoRouter(
  navigatorKey: navigatorKey,
  debugLogDiagnostics: true,
  urlPathStrategy: UrlPathStrategy.path,
  initialLocation: '/',
  errorPageBuilder: (context, state) => _navigate(
    context,
    state,
    ErrorPage(
      error: state.error,
    ),
  ),
  routes: [
    GoRoute(
        path: '/',
        name: Routes.login.name,
        pageBuilder: (context, state) => _navigate(
              context,
              state,
              const LoginPage(),
            ),
        routes: [
          GoRoute(
            path: 'home',
            name: Routes.home.name,
            pageBuilder: (context, state) {
              return _navigate(context, state, const EmployeesPage());
            },
          ),
          GoRoute(
            path: 'detail-employees',
            name: Routes.detail.name,
            pageBuilder: (context, state) {
              final extras = (state.extra as Extras).extras;
              final employeesId = extras[Keys.employeesId];

              return _navigate(
                context,
                state,
                DetailEmployeesPage(
                  employeesId: employeesId,
                ),
              );
            },
          ),
          GoRoute(
            path: 'create-employees',
            name: Routes.create.name,
            pageBuilder: (context, state) {
              return _navigate(context, state, const CreateEmployeesPage());
            },
          ),
        ]),
  ],
);

Page<void> _navigate(BuildContext context, GoRouterState state, Widget screen) {
  return MaterialPage<void>(
    key: state.pageKey,
    restorationId: state.pageKey.value,
    child: screen,
  );
}
