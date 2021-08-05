import '../entities/user_entity.dart';

abstract class LocalStorageRepository {
  Future<String> getToken();
  Future<String> saveToken(String token);
  Future<void> clearAllData();
  Future<UserEntity> saveUser(UserEntity user);
  Future<UserEntity> getUser();
  // Future<bool> isDarkTheme();
  // Future<void> saveDarkTheme(bool darkTheme);

}
