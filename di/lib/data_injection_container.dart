import 'package:data/local_database/local_database.dart';
import 'package:data/users/datasources/api/user_api_data_source.dart';
import 'package:data/users/datasources/db/user_db_datasource.dart';
import 'package:data/users/repository/user_repository_impl.dart';
import 'package:domain/users/repository/user_repository.dart';
import 'package:get_it/get_it.dart';

Future initData() async {
  var getIt = GetIt.instance;

  //instanta de LocalDataBase
  getIt.registerLazySingleton(() => LocalDataBase());

  //DataSources
  getIt.registerLazySingleton<UserApiDataSource>(() => UserApiDataSourceImpl());
  getIt.registerLazySingleton<UserDbDataSource>(() => UserDbDataSourceImpl(getIt.get<LocalDataBase>()));

  //Repositorii
  getIt.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(getIt.get<UserApiDataSource>(), getIt.get<UserDbDataSource>()));
}
