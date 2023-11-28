import 'dart:convert';

import '../../domain/entities/result_entity.dart';

SearchResultModel searchResultModelFromJson(String str) =>
    SearchResultModel.fromJson(json.decode(str));

class SearchResultModel extends SearchResultEntity {
  const SearchResultModel({required List<SearchDataEntity> data})
      : super(data: data);

  factory SearchResultModel.fromJson(Map<String, dynamic> json) =>
      SearchResultModel(
        data: List<SearchDataEntity>.from(
            json["legs"].map((x) => SearchDataModel.fromJson(x))),
      );
}

class SearchDataModel extends SearchDataEntity {
  const SearchDataModel({
    required String id,
    required String departureTime,
    required String arrivalTime,
    required String duration,
    required String departureAirportCode,
    required String arrivalAirportCode,
    required int stopoversCount,
    required double score,
  }) : super(
            id: id,
            departureTime: departureTime,
            arrivalTime: arrivalTime,
            duration: duration,
            departureAirportCode: departureAirportCode,
            arrivalAirportCode: arrivalAirportCode,
            stopoversCount: stopoversCount,
            score: score);

  factory SearchDataModel.fromJson(Map<String, dynamic> json) =>
      SearchDataModel(
        id: json["id"].toString().split(":")[1],
        departureTime: json["departureTime"],
        arrivalTime: json["arrivalTime"],
        duration: json["duration"],
        departureAirportCode: json["departureAirportCode"],
        arrivalAirportCode: json["arrivalAirportCode"],
        stopoversCount: json["stopoversCount"],
        score: double.parse(json["score"].toString()),
      );
}
