import '../entities/login_request.dart';
import '../entities/login_response.dart';
import '../entities/user_entity.dart';
import '../repositories/api_repository.dart';

class AuthUseCase {
  final ApiRepository apiRepository;

  AuthUseCase({this.apiRepository});

  Future<UserEntity> getUserFromId(int userId) async {
    return await apiRepository.getUserFromId(userId);
  }

  Future<LoginResponse> login(LoginRequest login) async {
    return await apiRepository.login(login);
  }

  Future<void> logout(String token) async {
    return await apiRepository.logout(token);
  }
}
