import 'dart:convert';

import '../../../../core/util/air_port_models.dart';

SearchParams searchParamsFromJson(String str) =>
    SearchParams.fromJson(json.decode(str));

String searchParamsToJson(SearchParams data) => json.encode(data.toJson());

class SearchParams {
  final AirPortModel from;
  final AirPortModel to;
  final String date;
  final int adult;
  final int children;
  final int flightClass;

  SearchParams({
    required this.from,
    required this.to,
    required this.date,
    required this.adult,
    required this.children,
    required this.flightClass,
  });

  factory SearchParams.fromJson(Map<String, dynamic> json) => SearchParams(
        from: json["from"],
        to: json["to"],
        date: json["date"],
        adult: json["adult"],
        children: json["children"],
        flightClass: json["class"],
      );

  Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "date": date,
        "adult": adult,
        "children": children,
        "class": flightClass,
      };
}
