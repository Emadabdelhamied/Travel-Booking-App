import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_booking_app/core/constants/colors/colors.dart';
import 'package:travel_booking_app/core/constants/styles/styles.dart';

class PrimaryButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final double? width;
  const PrimaryButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60.h,
        width: width,
        decoration: BoxDecoration(
            color: primary, borderRadius: BorderRadius.circular(35.r)),
        child: Center(
            child: Text(
          text,
          style: TextStyles.textViewBold22.copyWith(color: white),
        )),
      ),
    );
  }
}
