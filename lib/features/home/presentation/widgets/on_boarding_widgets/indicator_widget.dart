import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotIndicator extends StatelessWidget {
  final bool isActive;

  const DotIndicator({this.isActive = false, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 10.w,
      height: isActive ? 25.h : 10.h,
      margin: EdgeInsetsDirectional.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(25)),
    );
  }
}
