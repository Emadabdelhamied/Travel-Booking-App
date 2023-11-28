library country_state_city_picker_nona;

import 'dart:convert';

import 'package:country_state_city_picker/model/select_status_model.dart'
    // ignore: library_prefixes
    as StatusModel;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:travel_booking_app/core/util/air_port_models.dart';

import '../../util/countries_list.dart';
import '../colors/colors.dart';

class SelectContry extends StatefulWidget {
  final ValueChanged<AirPortModel> onCountryChanged;
  final TextStyle? style;
  final String title;
  final Color? dropdownColor;

  const SelectContry(
      {Key? key,
      required this.onCountryChanged,
      required this.title,
      this.style,
      this.dropdownColor})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SelectContryState createState() => _SelectContryState();
}

class _SelectContryState extends State<SelectContry> {
  final List<AirPortModel> _country = [];

  AirPortModel? _selectedCountry;

  @override
  void initState() {
    getCounty();
    super.initState();
  }

  Future getCounty() async {
    for (var data in listOfCountries) {
      if (!mounted) continue;
      setState(() {
        _country.add(AirPortModel(code: data['code'], name: data['name']));
      });
    }

    return _country;
  }

  void _onSelectedCountry(AirPortModel value) {
    if (!mounted) return;
    setState(() {
      _selectedCountry = value;
      widget.onCountryChanged(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<AirPortModel>(
      dropdownColor: white,
      isExpanded: true,
      autofocus: true,
      hint: Text(tr("choose_country")),
      decoration: InputDecoration(
        filled: true,
        focusedBorder: const UnderlineInputBorder(),
        labelText: tr(widget.title),
        border: const UnderlineInputBorder(),
      ),
      icon: const SizedBox(),
      items: _country.map((AirPortModel dropDownStringItem) {
        return DropdownMenuItem<AirPortModel>(
          value: dropDownStringItem,
          child: Center(
            child: Text(
              dropDownStringItem.name,
              style: widget.style,
            ),
          ),
        );
      }).toList(),
      onChanged: (value) => _onSelectedCountry(value!),
      value: _selectedCountry,
    );
  }
}
