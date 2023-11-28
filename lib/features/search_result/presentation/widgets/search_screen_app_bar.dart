import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';
import 'package:travel_booking_app/core/constants/colors/colors.dart';
import 'package:travel_booking_app/core/constants/styles/styles.dart';

import '../../../../../core/util/navigator.dart';
import '../../../../../injection_container.dart';
import '../../../../core/constants/icons/icons.dart';
import '../../../home/data/models/search_params.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final SearchParams data;

  const SearchAppBar({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    String flightClass = "";
    switch (data.flightClass) {
      case 0:
        {
          flightClass = tr("economy");
        }
        break;

      case 1:
        {
          flightClass = tr("bussiness");
        }
        break;

      case 2:
        {
          flightClass = tr("first");
        }
        break;
      default:
        {
          flightClass = tr("economy");
        }
        break;
    }
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
                          sl<AppNavigator>().pop();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: white,
                        )),
                    Text(tr("search_result"),
                        style:
                            TextStyles.textViewMedium20.copyWith(color: white)),
                    SizedBox(
                      width: 25.w,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data.from.code,
                      style: TextStyles.textViewMedium22.copyWith(color: white),
                    ),
                    Localizations.localeOf(context).languageCode == "ar"
                        ? Transform.flip(
                            flipX: true,
                            child: SvgPicture.asset(
                              planeIcon,
                              width: 200.w,
                              // ignore: deprecated_member_use
                              color: white,
                            ),
                          )
                        : SvgPicture.asset(
                            planeIcon,
                            width: 200.w,
                            // ignore: deprecated_member_use
                            color: white,
                          ),
                    Text(
                      data.to.code,
                      style: TextStyles.textViewMedium22.copyWith(color: white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data.from.name,
                      style:
                          TextStyles.textViewRegular12.copyWith(color: white),
                    ),
                    Text(
                      data.to.name,
                      style:
                          TextStyles.textViewRegular12.copyWith(color: white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr("one_way"),
                      style:
                          TextStyles.textViewRegular12.copyWith(color: white),
                    ),
                    Text(
                      data.date,
                      style:
                          TextStyles.textViewRegular12.copyWith(color: white),
                    ),
                    Text(
                      flightClass,
                      style:
                          TextStyles.textViewRegular12.copyWith(color: white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  @override
  Size get preferredSize => Size(double.infinity, 200.h);
}
