import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../home/data/models/search_params.dart';
import '../entities/result_entity.dart';

abstract class SearchRepository {
  Future<Either<Failure, SearchResultEntity>> getFlights(
      {required SearchParams params});
}
