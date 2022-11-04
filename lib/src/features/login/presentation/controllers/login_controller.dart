import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_transisi/src/features/login/application/login_service.dart';
import 'package:flutter_transisi/src/features/login/domain/login.dart';

class LoginAuthController extends StateNotifier<AsyncValue<void>> {
  LoginAuthController({required this.loginAuthService})
      : super(const AsyncData<void>(null));

  final LoginAuthService loginAuthService;

  String _email = '';
  String _password = '';

  void changedEmail(String? value) {
    _email = value ?? '';
  }

  void changedPassword(String? value) {
    _password = value ?? '';
  }

  Future<void> login() async {
    state = const AsyncValue.loading();

    final loginAuth = LoginAuth(
      email: _email,
      password: _password,
    );

    final result = await loginAuthService.login(loginAuth: loginAuth);
    result.when(
        success: (data) => state = AsyncValue.data(data),
        failure: (error, stacktrace) => state = AsyncError(error, stacktrace));
  }
}

final loginAuthControllerProvider =
    StateNotifierProvider.autoDispose<LoginAuthController, AsyncValue<void>>(
        (ref) => LoginAuthController(
            loginAuthService: ref.watch(loginAuthServiceProvider)));
