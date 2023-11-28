part of 'search_result_cubit.dart';

abstract class SearchResultState extends Equatable {
  const SearchResultState();

  @override
  List<Object> get props => [];
}

class SearchResultInitial extends SearchResultState {}

class GetSearchLoadingState extends SearchResultState {}

class GetSearchErrorState extends SearchResultState {
  final String message;
  const GetSearchErrorState({required this.message});
}

class GetSearchSuccessState extends SearchResultState {
  final List<SearchDataEntity> data;

  const GetSearchSuccessState({required this.data});
}
