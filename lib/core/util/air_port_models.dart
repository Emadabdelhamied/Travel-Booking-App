import 'dart:convert';

AirPortModel airPortModelFromJson(String str) =>
    AirPortModel.fromJson(json.decode(str));

class AirPortModel {
  final String code;
  final String name;

  AirPortModel({
    required this.code,
    required this.name,
  });

  factory AirPortModel.fromJson(Map<String, dynamic> json) => AirPortModel(
        code: json["code"],
        name: json["name"],
      );
}
