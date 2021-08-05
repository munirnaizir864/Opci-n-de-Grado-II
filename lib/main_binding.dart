import 'package:cruz_roja/domain/usecases/user_usecase.dart';
import 'package:get/instance_manager.dart';

import 'data/datasource/api_data_source.dart';
import 'data/datasource/local_storage_data_source.dart';
import 'data/repositories/api_repository.dart';
import 'data/repositories/local_storage_repository.dart';
import 'domain/repositories/api_repository.dart';
import 'domain/repositories/local_storage_repository.dart';
import 'package:cruz_roja/domain/usecases/auth_usecase.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalStorageRepository>(() => LocalStorageRepositoryImpl(
        localStorageDataSource: LocalStorageDataSourceImpl()));
    Get.lazyPut<ApiRepository>(
        () => ApiRepositoryImpl(apiDataSource: ApiDataSourceImpl()));
    Get.lazyPut<UserUseCases>(() => UserUseCases(
        apiRepository: ApiRepositoryImpl(apiDataSource: ApiDataSourceImpl()),
        localStorageRepository: LocalStorageRepositoryImpl(
            localStorageDataSource: LocalStorageDataSourceImpl())));
    Get.lazyPut<AuthUseCase>(() => AuthUseCase(
        apiRepository: ApiRepositoryImpl(apiDataSource: ApiDataSourceImpl())));
  }
}
