import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_booking_app/core/constants/colors/colors.dart';

import '../../../../../core/constants/widgets/countries.dart';
import '../../../../../core/constants/widgets/custom_drop_down.dart';
import '../../../../../core/constants/widgets/date_widget.dart';
import '../../cubit/filter_cubit/filter_cubit.dart';
import '../../cubit/home_cubit.dart';
import '../app_bar_widgets/filter_button.dart';

class FlightSearchCard extends StatelessWidget {
  const FlightSearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      dashPattern: const [4, 2],
      color: primary.withOpacity(0.2),
      borderType: BorderType.RRect,
      radius: Radius.circular(35.r),
      strokeWidth: 2,
      child: Padding(
        padding: EdgeInsets.all(15.r),
        child: Container(
          height: 400.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: white, borderRadius: BorderRadius.circular(35.r)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150.w,
                  child: SelectContry(
                    title: tr("from"),
                    onCountryChanged: (value) {
                      context.read<HomeCubit>().flightFrom = value;
                      log(value.code);
                    },
                  ),
                ),
                SizedBox(
                  width: 150.w,
                  child: SelectContry(
                    title: tr("to"),
                    onCountryChanged: (value) {
                      context.read<HomeCubit>().flightTo = value;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            const DateWidget(),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150.w,
                  child: CustomDropDown(
                      title: tr("adults"),
                      onValueChanged: (value) {
                        context.read<HomeCubit>().adultNumber =
                            int.parse(value);
                      }),
                ),
                SizedBox(
                  width: 150.w,
                  child: CustomDropDown(
                      title: tr("children"),
                      onValueChanged: (value) {
                        context.read<HomeCubit>().childrenNumber =
                            int.parse(value);
                      }),
                ),
              ],
            ),
            SizedBox(height: 40.h),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return SizedBox(
                  height: 35.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) => FilterButton(
                      border: 7,
                      onTap: () {
                        context.read<HomeCubit>().setFlightIsSelected = index;
                      },
                      color:
                          context.watch<HomeCubit>().flightIsSelected == index
                              ? primary
                              : white,
                      text: context.read<HomeCubit>().flightTypes[index],
                    ),
                  ),
                );
              },
            )
          ]),
        ),
      ),
    );
  }
}
//hr@tqiait.com
