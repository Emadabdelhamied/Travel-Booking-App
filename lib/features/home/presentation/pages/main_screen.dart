import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_booking_app/core/constants/colors/colors.dart';
import 'package:travel_booking_app/core/constants/styles/styles.dart';
import 'package:travel_booking_app/core/constants/widgets/primary_button.dart';
import 'package:travel_booking_app/features/home/data/models/search_params.dart';
import 'package:travel_booking_app/features/home/presentation/cubit/filter_cubit/filter_cubit.dart';
import '../../../../core/constants/widgets/tost.dart';
import '../../../../core/util/navigator.dart';
import '../../../../injection_container.dart';
import '../cubit/home_cubit.dart';
import '../widgets/app_bar_widgets/home_app_bar.dart';
import '../widgets/body_widgets/flight_search_card.dart';
import '../../../search_result/presentation/pages/search_result_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: const HomeAppBar(),
      body: BlocProvider<HomeCubit>(
        lazy: false,
        create: (context) => HomeCubit(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            var homeCubit = context.read<HomeCubit>();
            return Padding(
              padding: EdgeInsets.all(20.r),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const FlightSearchCard(),
                    SizedBox(
                      height: 40.h,
                    ),
                    PrimaryButton(
                        onTap: () {
                          if (context.read<HomeCubit>().flightFrom == null) {
                            customToast(
                                isError: true, content: tr("from_error"));
                          } else if (context.read<HomeCubit>().flightTo ==
                              null) {
                            customToast(isError: true, content: tr("to_error"));
                          } else if (context
                                  .read<HomeCubit>()
                                  .flightFrom!
                                  .code ==
                              context.read<HomeCubit>().flightTo!.code) {
                            customToast(
                                isError: true,
                                content: tr("origin_desnation_error"));
                          } else {
                            sl<AppNavigator>().push(
                                screen: SearchResultScreen(
                                    data: SearchParams(
                              from: homeCubit.flightFrom!,
                              to: homeCubit.flightTo!,
                              date: homeCubit.flightDate!,
                              adult: homeCubit.adultNumber,
                              children: homeCubit.childrenNumber,
                              flightClass: homeCubit.flightIsSelected,
                            )));
                          }
                        },
                        text: tr("search_flight")),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      tr("offers_val"),
                      style: TextStyles.textViewBold25,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
