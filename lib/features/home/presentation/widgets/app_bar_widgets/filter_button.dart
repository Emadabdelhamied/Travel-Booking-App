import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_booking_app/core/constants/colors/colors.dart';
import 'package:travel_booking_app/core/constants/styles/styles.dart';

class FilterButton extends StatelessWidget {
  final Color color;
  final int border;
  final Function() onTap;
  final String text;
  const FilterButton(
      {super.key,
      required this.color,
      required this.border,
      required this.onTap,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 40.h,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(border.r),
              border: Border.all(color: primary)),
          child: Center(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(tr(text),
                style: TextStyles.textViewMedium20
                    .copyWith(color: color == white ? primary : white)),
          )),
        ),
      ),
    );
  }
}
