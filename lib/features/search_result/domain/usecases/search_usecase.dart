import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/util/usecase.dart';
import '../../../home/data/models/search_params.dart';
import '../entities/result_entity.dart';
import '../repositories/search_repository.dart';

class GetFlightsUsecase extends UseCase<SearchResultEntity, SearchParams> {
  final SearchRepository searchRepository;

  GetFlightsUsecase({required this.searchRepository});

  @override
  Future<Either<Failure, SearchResultEntity>> call(SearchParams params) =>
      searchRepository.getFlights(params: params);
}
