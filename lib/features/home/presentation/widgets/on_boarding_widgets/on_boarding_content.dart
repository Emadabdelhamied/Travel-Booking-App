import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_booking_app/core/constants/colors/colors.dart';
import 'package:travel_booking_app/core/constants/styles/styles.dart';

class OnboardingContent extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingContent(
      {required this.image,
      required this.title,
      required this.description,
      super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: 50.h),
              child: Image.asset(image, width: double.infinity)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Text(
              title,
              style: TextStyles.textViewBold25.copyWith(color: white),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              description,
              style: const TextStyle(
                  color: white, fontSize: 13, fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
