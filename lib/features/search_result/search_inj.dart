import 'package:get_it/get_it.dart';

import 'data/datasources/search_datasource.dart';

import 'data/repositories/search_repository_imp.dart';
import 'domain/repositories/search_repository.dart';
import 'domain/usecases/search_usecase.dart';
import 'presentation/cubit/search_result_cubit.dart';

Future<void> initSearchInjection(GetIt sl) async {
  //* cubit

  sl.registerFactory(() => SearchResultCubit(getFlightsUsecase: sl()));

  sl.registerLazySingleton(() => GetFlightsUsecase(searchRepository: sl()));

  sl.registerLazySingleton<SearchRepository>(
    () => SearchRepositoryImp(
      searchdataSource: sl(),
    ),
  );

  //* Data sources
  sl.registerLazySingleton<SearchDataSource>(
    () => SearchDataSourceImp(
      apiConsumer: sl(),
    ),
  );
}
