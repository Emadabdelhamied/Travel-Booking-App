import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_booking_app/core/constants/colors/colors.dart';
import 'package:travel_booking_app/core/constants/images/images.dart';
import 'package:travel_booking_app/core/constants/styles/styles.dart';
import 'package:travel_booking_app/core/util/api_basehelper.dart';
import 'package:travel_booking_app/features/home/presentation/cubit/filter_cubit/filter_cubit.dart';
import 'package:travel_booking_app/features/home/presentation/widgets/app_bar_widgets/filter_button.dart';

import '../../../../../core/util/navigator.dart';
import '../../../../../injection_container.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size(double.infinity, 200.h),
        child: Container(
          decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50.r),
                bottomRight: Radius.circular(50.r),
              )),
          child: Column(
            children: [
              SizedBox(
                height: 60.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        if (Localizations.localeOf(context).languageCode ==
                            "ar") {
                          context.setLocale(const Locale("en"));
                          sl<ApiBaseHelper>().updateLocalInHeaders("en");
                          sl<AppNavigator>().popToFrist();
                        } else {
                          context.setLocale(const Locale("ar"));
                          sl<ApiBaseHelper>().updateLocalInHeaders("ar");
                          sl<AppNavigator>().popToFrist();
                        }
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5.w,
                          ),
                          const Icon(
                            Icons.language,
                            color: white,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                              Localizations.localeOf(context).languageCode ==
                                      "ar"
                                  ? "EN"
                                  : "AR",
                              style: TextStyles.textViewMedium20
                                  .copyWith(color: white))
                        ],
                      ),
                    ),
                    Text(tr("book_your_flight"),
                        style:
                            TextStyles.textViewMedium20.copyWith(color: white)),
                    const CircleAvatar(
                      backgroundColor: primary,
                      backgroundImage: NetworkImage(userImage),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 60.h,
              ),
              BlocProvider(
                create: (context) => FilterCubit(),
                child: BlocBuilder<FilterCubit, FilterState>(
                  builder: (context, state) {
                    return SizedBox(
                      height: 35.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) => FilterButton(
                          border: 20,
                          onTap: () {
                            context.read<FilterCubit>().setFilterIsSelected =
                                index;
                          },
                          color:
                              context.watch<FilterCubit>().filterIsSelected ==
                                      index
                                  ? white
                                  : primary,
                          text: context.read<FilterCubit>().tripTyps[index],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }

  @override
  Size get preferredSize => Size(double.infinity, 200.h);
}
