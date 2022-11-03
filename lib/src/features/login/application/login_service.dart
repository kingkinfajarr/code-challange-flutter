import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_transisi/src/features/login/data/repositories/login_repository.dart';
import 'package:flutter_transisi/src/features/login/domain/login.dart';
import 'package:flutter_transisi/src/services/network/api_result.dart';

class LoginAuthService {
  final Ref ref;

  LoginAuthService({
    required this.ref,
  });

  Future<ApiResult<void>> login({required LoginAuth loginAuth}) async {
    return ref.read(loginAuthRepositoryProvider).login(loginAuth: loginAuth);
  }
}

final loginAuthServiceProvider = Provider<LoginAuthService>((ref) {
  return LoginAuthService(ref: ref);
});
