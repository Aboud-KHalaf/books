import 'package:book/Features/home/data/repos/home_repo_impl.dart';
import 'package:book/core/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(ApiService(Dio())),
  );
}
