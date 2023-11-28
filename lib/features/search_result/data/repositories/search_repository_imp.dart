import 'package:dartz/dartz.dart';

import 'package:travel_booking_app/core/error/failures.dart';

import 'package:travel_booking_app/features/home/data/models/search_params.dart';

import 'package:travel_booking_app/features/search_result/domain/entities/result_entity.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/search_repository.dart';
import '../datasources/search_datasource.dart';

class SearchRepositoryImp extends SearchRepository {
  final SearchDataSource searchdataSource;

  SearchRepositoryImp({required this.searchdataSource});
  @override
  Future<Either<Failure, SearchResultEntity>> getFlights(
      {required SearchParams params}) async {
    try {
      final res = await searchdataSource.getFlights(
        params: params,
      );
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
