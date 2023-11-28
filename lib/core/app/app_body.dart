import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_booking_app/core/constants/colors/colors.dart';
import 'package:travel_booking_app/features/home/presentation/pages/main_screen.dart';
import 'package:travel_booking_app/features/home/presentation/pages/on_boarding_screen.dart';
import '../../bloc/main_cubit/bloc_main_cubit.dart';
import '../util/api_basehelper.dart';
import '../util/navigator.dart';
import 'app_data.dart';
import '../../injection_container.dart';
import 'app_inj.dart';

class AppBody extends StatelessWidget {
  const AppBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          ...appMainBlocs(context),
        ],
        child: BlocConsumer<BlocMainCubit, BlocMainState>(
            listener: (context, state) {
          if (state is UpdateDataState) {
            log(state.appData.toString());
          } else {
            log(state.props.toString());
          }
        }, builder: (context, state) {
          final bloc = BlocMainCubit(repository: sl());

          Widget currentPage;
          switch (bloc.appState) {
            case AppState.notSeenTutorial:
              currentPage = const OnBoardingScreen();
              break;
            case AppState.unauthenticated:
              currentPage = const MainScreen();
              break;

            default:
              currentPage = const MainScreen();
          }
          rebuildAllChildren(context);

          sl<ApiBaseHelper>().updateLocalInHeaders(
              EasyLocalization.of(context)!.currentLocale!.languageCode);
          return ScreenUtilInit(
            designSize: const Size(428, 926),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (BuildContext context, Widget? child) {
              return MaterialApp(
                navigatorKey: sl<AppNavigator>().navigatorKey,
                theme: ThemeData(
                    appBarTheme: const AppBarTheme(
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                    ),
                    fontFamily: EasyLocalization.of(context)!
                                .currentLocale!
                                .languageCode ==
                            "ar"
                        ? "Cairo"
                        : "Poppins",
                    hintColor: black,
                    primaryColor: primary,
                    scrollbarTheme: const ScrollbarThemeData().copyWith(
                      thumbColor:
                          MaterialStateProperty.all(const Color(0xffff8297)),
                    ),
                    colorScheme: ColorScheme.fromSwatch()
                        .copyWith(primary: primary, secondary: primary)),
                debugShowCheckedModeBanner: false,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                routes: const {},
                home: Builder(
                  builder: (context) {
                    return currentPage;
                  },
                ),
              );
            },
          );
        }));
  }
}

void rebuildAllChildren(BuildContext context) {
  void rebuild(Element el) {
    el.markNeedsBuild();
    el.visitChildren(rebuild);
  }

  (context as Element).visitChildren(rebuild);
}
