import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/main_cubit/bloc_main_cubit.dart';
import '../../injection_container.dart';

Future<void> initAppMainjection(GetIt sl) async {
  //* cubit

  sl.registerFactory<BlocMainCubit>(() => BlocMainCubit(repository: sl()));
}
List<BlocProvider> appMainBlocs(BuildContext context) => [
      BlocProvider<BlocMainCubit>(
          create: (BuildContext context) => sl<BlocMainCubit>()),
    ];