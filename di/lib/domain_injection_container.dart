import 'package:domain/users/repository/user_repository.dart';
import 'package:domain/users/use_cases/get_users_from_api_use_Case.dart';
import 'package:domain/users/use_cases/get_users_stream_use_case.dart';
import 'package:get_it/get_it.dart';

Future initDomain() async {
  var getIt = GetIt.instance;

  getIt.registerLazySingleton<GetUsersFromApiUseCase>(() => GetUsersFromApiUseCase(getIt.get<UserRepository>()));
  getIt.registerLazySingleton<GetUsersStreamUseCase>(() => GetUsersStreamUseCase(getIt.get<UserRepository>()));
}
