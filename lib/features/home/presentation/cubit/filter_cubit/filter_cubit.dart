import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterInitial());
  int _filterIsSelected = 0;
  int get filterIsSelected => _filterIsSelected;
  set setFilterIsSelected(int value) {
    _filterIsSelected = value;
    emit(SetSelectedFilter());
    emit(FilterInitial());
  }

  List tripTyps = [
    "one_way",
    "round_trip",
    "multi",
  ];
}
