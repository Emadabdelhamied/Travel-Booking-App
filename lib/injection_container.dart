import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_booking_app/core/app/app_inj.dart';
import 'package:travel_booking_app/core/app/app_repository.dart';
import 'package:travel_booking_app/core/app/app_storage.dart';
import 'package:travel_booking_app/core/util/api_basehelper.dart';
import 'package:travel_booking_app/core/util/navigator.dart';

import 'features/search_result/search_inj.dart';

final sl = GetIt.instance;
final ApiBaseHelper helper = ApiBaseHelper();
Future<void> init() async {
  initAppMainjection(sl);
  initSearchInjection(sl);

  // core

  sl.registerLazySingleton<AppNavigator>(() => AppNavigator());
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(
      () => AppRepository(KeyValueStorage(sharedPreferences)));
  helper.dioInit(Dio(
    BaseOptions(
      receiveDataWhenStatusError: true,
      baseUrl: ApiBaseHelper.baseUrl,
      headers: {
        "Content-Type": 'application/json',
        "app-type": "client",
        'Accept': 'application/json',
      },
      connectTimeout: const Duration(milliseconds: 30000),
      sendTimeout: const Duration(milliseconds: 30000),
      receiveTimeout: const Duration(milliseconds: 30000),
    ),
  ));
  sl.registerLazySingleton(() => helper);
}
