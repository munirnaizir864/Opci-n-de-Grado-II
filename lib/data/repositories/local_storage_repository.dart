import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/local_storage_repository.dart';
import '../datasource/local_storage_data_source.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDataSource localStorageDataSource;

  LocalStorageRepositoryImpl({this.localStorageDataSource});

  @override
  Future<void> clearAllData() async {
    return await localStorageDataSource.clearAllData();
  }

  @override
  Future<String> getToken() async {
    return await localStorageDataSource.getToken();
  }

  @override
  Future<String> saveToken(String token) async {
    return await localStorageDataSource.saveToken(token);
  }

  @override
  Future<UserEntity> getUser() async {
    return await localStorageDataSource.getUser();
  }

  @override
  Future<UserEntity> saveUser(UserEntity user) async {
    return await localStorageDataSource.saveUser(user);
  }

  // @override
  // Future<bool> isDarkTheme() async {
  //   return await localStorageDataSource.isDarkTheme();
  // }

  // @override
  // Future<void> saveDarkTheme(bool isDark) async {
  //   return await localStorageDataSource.saveDarkTheme(isDark);
  // }

}
