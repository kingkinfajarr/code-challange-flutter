import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_transisi/src/exceptions/network_exceptions.dart';
import 'package:flutter_transisi/src/features/login/domain/login.dart';
import 'package:flutter_transisi/src/services/network/api_result.dart';
import 'package:flutter_transisi/src/services/network/dio_client.dart';
import 'package:flutter_transisi/src/services/network/endpoints.dart';

class LoginAuthRepository {
  final DioClient _dioClient;

  LoginAuthRepository(this._dioClient);

  Future<ApiResult<void>> login({required LoginAuth loginAuth}) async {
    try {
      await _dioClient.post(Endpoints.loginUser, data: loginAuth.toJson());
      return const ApiResult.success(null);
    } catch (e, stacktrace) {
      return ApiResult.failure(
        NetworkExceptions.getDioException(e),
        stacktrace,
      );
    }
  }
}

final loginAuthRepositoryProvider = Provider<LoginAuthRepository>((ref) {
  return LoginAuthRepository(ref.read(dioClientProvider));
});
