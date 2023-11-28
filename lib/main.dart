import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_booking_app/injection_container.dart' as di;
import 'core/app/app_body.dart';
import 'core/util/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await EasyLocalization.ensureInitialized();
  await di.init();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      path: 'lang',
      saveLocale: true,
      startLocale: const Locale('en'),
      useOnlyLangCode: true,
      child: const AppBody(),
    ),
  );
}
