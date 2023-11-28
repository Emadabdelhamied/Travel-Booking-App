import 'dart:developer';

import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_booking_app/core/constants/images/images.dart';
import 'package:travel_booking_app/core/constants/widgets/countries.dart';
import 'package:travel_booking_app/features/home/data/models/search_params.dart';

import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/icons/icons.dart';
import '../../../../core/constants/styles/styles.dart';
import '../../../../injection_container.dart';
import '../cubit/search_result_cubit.dart';
import '../widgets/search_card.dart';
import '../widgets/search_screen_app_bar.dart';

class SearchResultScreen extends StatefulWidget {
  final SearchParams data;
  const SearchResultScreen({super.key, required this.data});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: SearchAppBar(
        data: widget.data,
      ),
      body: BlocProvider<SearchResultCubit>(
        lazy: false,
        create: (context) =>
            sl<SearchResultCubit>()..fGetFlights(params: widget.data),
        child: Padding(
          padding: EdgeInsets.all(15.r),
          child: BlocBuilder<SearchResultCubit, SearchResultState>(
            builder: (context, state) {
              if (state is GetSearchLoadingState) {
                return Center(
                    child: SizedBox(
                        height: 100.h, child: Lottie.asset(loadingIcon)));
              } else if (state is GetSearchSuccessState) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${state.data.length} ${tr("available_flights")}",
                            style: TextStyles.textViewMedium16
                                .copyWith(color: grey),
                          ),
                          const Icon(Icons.filter_list_sharp, color: grey)
                        ],
                      ),
                      state.data.isEmpty
                          ? Column(children: [
                              SizedBox(
                                height: 200.h,
                              ),
                              Image.asset(
                                plane,
                              ),
                            ])
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.data.length,
                              itemBuilder: (context, index) =>
                                  SearchCard(flightData: state.data[index]),
                            ),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: Text("Error"),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
