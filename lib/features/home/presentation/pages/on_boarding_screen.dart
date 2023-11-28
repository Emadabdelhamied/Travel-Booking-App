import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_booking_app/core/constants/colors/colors.dart';

import '../../../../bloc/main_cubit/bloc_main_cubit.dart';
import '../../../../core/constants/styles/styles.dart';
import '../../../../core/util/navigator.dart';
import '../../../../injection_container.dart';
import '../../data/models/on_boarding_model.dart';
import '../widgets/on_boarding_widgets/indicator_widget.dart';
import '../widgets/on_boarding_widgets/on_boarding_content.dart';
import 'main_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemCount: onboardingData.length,
                itemBuilder: (context, index) => OnboardingContent(
                  image: onboardingData[index].image,
                  title: onboardingData[index].title,
                  description: onboardingData[index].description,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.all(20.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ...List.generate(
                          onboardingData.length,
                          (index) => DotIndicator(
                                isActive: index == _pageIndex,
                              ))
                    ],
                  ),
                  _pageIndex == onboardingData.length - 1
                      ? AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 150.w,
                          height: 60.h,
                          child: ElevatedButton(
                            onPressed: () {
                              sl<AppNavigator>()
                                  .pushReplacement(screen: const MainScreen());
                              sl<BlocMainCubit>().seenIntro();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              alignment: Alignment.center,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  tr("start"),
                                  style: TextStyles.textViewBold22
                                      .copyWith(color: primary),
                                ),
                                const Icon(Icons.arrow_forward_rounded,
                                    color: primary, size: 30),
                              ],
                            ),
                          ),
                        )
                      : AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 60,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: const CircleBorder(),
                              alignment: Alignment.center,
                            ),
                            child: const Icon(Icons.arrow_forward_rounded,
                                color: primary, size: 30),
                          ),
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
