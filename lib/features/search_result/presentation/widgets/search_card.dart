import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/icons/icons.dart';
import '../../../../core/constants/styles/styles.dart';
import '../../../../core/constants/widgets/primary_button.dart';
import '../../domain/entities/result_entity.dart';

class SearchCard extends StatelessWidget {
  final SearchDataEntity flightData;
  const SearchCard({super.key, required this.flightData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h),
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          DottedBorder(
            dashPattern: const [4, 2],
            color: primary.withOpacity(0.2),
            borderType: BorderType.RRect,
            radius: Radius.circular(35.r),
            strokeWidth: 2,
            child: Container(
              height: 150.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(35.r)),
              child: Padding(
                padding: EdgeInsets.all(20.r),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          flightData.id,
                          style: TextStyles.textViewMedium16
                              .copyWith(color: primary),
                        ),
                        Text(
                          flightData.duration,
                          style: TextStyles.textViewMedium16
                              .copyWith(color: primary),
                        ),
                        Text(
                          "${flightData.stopoversCount} ${tr("stops")}",
                          style:
                              TextStyles.textViewMedium16.copyWith(color: grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          flightData.departureTime,
                          style: TextStyles.textViewMedium22
                              .copyWith(color: primary),
                        ),
                        Localizations.localeOf(context).languageCode == "ar"
                            ? Transform.flip(
                                flipX: true,
                                child: SvgPicture.asset(
                                  planeIcon,
                                  width: 200.w,
                                  // ignore: deprecated_member_use
                                  color: primary,
                                ),
                              )
                            : SvgPicture.asset(
                                planeIcon,
                                width: 200.w,
                                // ignore: deprecated_member_use
                                color: primary,
                              ),
                        Text(
                          flightData.arrivalTime,
                          style: TextStyles.textViewMedium22
                              .copyWith(color: primary),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: 120.h,
              child: PrimaryButton(
                  width: 300.w,
                  onTap: () {},
                  text: "\$${flightData.score} ${tr("book_flight")}")),
        ],
      ),
    );
  }
}
