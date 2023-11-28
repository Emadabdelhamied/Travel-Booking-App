import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../../../home/data/models/search_params.dart';
import '../../domain/entities/result_entity.dart';
import '../../domain/usecases/search_usecase.dart';

part 'search_result_state.dart';

class SearchResultCubit extends Cubit<SearchResultState> {
  SearchResultCubit({required this.getFlightsUsecase})
      : super(SearchResultInitial());
  final GetFlightsUsecase getFlightsUsecase;
  Future<void> fGetFlights({required SearchParams params}) async {
    emit(GetSearchLoadingState());
    final response = await getFlightsUsecase(params);
    response.fold(
      (failure) {
        if (failure is ServerFailure) {
          emit(GetSearchErrorState(message: failure.message));
        }
      },
      (success) {
        emit(GetSearchSuccessState(data: success.data));
      },
    );
  }
}
