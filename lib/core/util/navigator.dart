import 'package:flutter/material.dart';
import 'package:travel_booking_app/core/app/app_body.dart';

class AppNavigator {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Future<void> push({required Widget screen}) async {
    await navigatorKey.currentState!.push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset(0.0, 0.0);
        const curve = Curves.easeIn;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    ));
  }

  Future<void> pushReplacement({required Widget screen}) async {
    await navigatorKey.currentState!.pushReplacement(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset(0.0, 0.0);
        const curve = Curves.easeIn;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    ));
  }

  dynamic pop({dynamic object}) {
    return navigatorKey.currentState!.pop<dynamic>(object);
  }

  dynamic popUtill({required Widget screen}) {
    return navigatorKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(builder: (c) => screen), (route) => false);
  }

  dynamic popToFrist({dynamic object}) {
    return navigatorKey.currentState!.popUntil((rout) => rout.isFirst);
  }

  dynamic popToMakanvi({dynamic object}) {
    return navigatorKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => const AppBody()),
        (Route<dynamic> route) => false);
  }
}
