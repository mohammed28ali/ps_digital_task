import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ps_digital_task/core/api/api_consumer.dart';
import 'package:ps_digital_task/core/api/app_interceptors.dart';
import 'package:ps_digital_task/core/api/dio_consumer.dart';
import 'package:ps_digital_task/core/network/netwok_info.dart'
    show NetworkInfo, NetworkInfoImpl;

final sl = GetIt.instance;
Future<void> init() async {
  await _initExternal();
  _initCore();
  _initDataSources();
  _initRepositories();
  _initUseCases();
  _initBlocs();
}

Future<void> _initExternal() async {
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker.createInstance());

  sl.registerLazySingleton(() => AppInterceptors());
}

Future<void> _initCore() async {
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectionChecker: sl()),
  );
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));
}

Future<void> _initDataSources() async {}

Future<void> _initRepositories() async {}

Future<void> _initUseCases() async {}

Future<void> _initBlocs() async {}
