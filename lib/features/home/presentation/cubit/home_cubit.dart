import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/air_port_models.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int _flightIsSelected = 0;
  int get flightIsSelected => _flightIsSelected;
  set setFlightIsSelected(int value) {
    _flightIsSelected = value;
    emit(SetFlightState());
    emit(HomeInitial());
  }

  List flightTypes = [
    "economy",
    "bussiness",
    "first",
  ];
  AirPortModel? flightFrom;
  AirPortModel? flightTo;
  String? flightDate;
  int childrenNumber = 0;
  int adultNumber = 0;
}
