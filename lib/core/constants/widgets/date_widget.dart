import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_booking_app/core/constants/styles/styles.dart';

import '../../../features/home/presentation/cubit/home_cubit.dart';

class DateWidget extends StatefulWidget {
  const DateWidget({super.key});

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> with RestorationMixin {
  final RestorableDateTime _selectedDate = RestorableDateTime(DateTime.now());
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );
  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        log('${_selectedDate.value.month}/${_selectedDate.value.day}/${_selectedDate.value.year}');
      });
    }
  }

  @override
  String? get restorationId => 'main';
  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime.now(),
          lastDate: DateTime(2030),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>().flightDate =
        '${_selectedDate.value.year}-${_selectedDate.value.month}-${_selectedDate.value.day}';

    return GestureDetector(
      onTap: () {
        _restorableDatePickerRouteFuture.present();
        context.read<HomeCubit>().flightDate =
            '${_selectedDate.value.year}-${_selectedDate.value.month}-${_selectedDate.value.day}';
      },
      child: Container(
        height: 60.h,
        width: 150.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.withOpacity(0.4),
              ),
              left: BorderSide.none,
              right: BorderSide.none,
              top: BorderSide.none,
            )),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tr("depature")),
              Center(
                child: Text(
                    '${_selectedDate.value.month}/${_selectedDate.value.day}/${_selectedDate.value.year}',
                    style: TextStyles.textViewBold20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
