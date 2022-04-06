// To parse this JSON data, do
//
//     final translate = translateFromJson(jsonString);

import 'dart:convert';

List<Translate> translateFromJson(String str) =>
    List<Translate>.from(json.decode(str).map((x) => Translate.fromJson(x)));

String translateToJson(List<Translate> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Translate {
  Translate({
    required this.translations,
  });

  List<Translation> translations;

  factory Translate.fromJson(Map<String, dynamic> json) => Translate(
        translations: List<Translation>.from(
            json["translations"].map((x) => Translation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
      };
}

class Translation {
  Translation({
    required this.text,
    required this.to,
  });

  String text;
  String to;

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        text: json["text"],
        to: json["to"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "to": to,
      };
}
