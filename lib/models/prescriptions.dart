// To parse this JSON data, do
//
//     final prescriptions = prescriptionsFromJson(jsonString);

import 'dart:convert';

List<Prescriptions> prescriptionsFromJson(String str) => List<Prescriptions>.from(json.decode(str).map((x) => Prescriptions.fromJson(x)));

String prescriptionsToJson(List<Prescriptions> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Prescriptions {
  Prescriptions({
    required this.id,
    required this.name,
    this.manufacturer,
    this.alternateMedicines,
    this.sideEffects,
  });

  int id;
  String name;
  String? manufacturer;
  String? alternateMedicines;
  String? sideEffects;

  factory Prescriptions.fromJson(Map<String, dynamic> json) => Prescriptions(
    id: json["id"],
    name: json["name"],
    manufacturer: json["manufacturer"],
    alternateMedicines: json["alternate_medicines"],
    sideEffects: json["side_effects"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "manufacturer": manufacturer,
    "alternate_medicines": alternateMedicines,
    "side_effects": sideEffects,
  };
}
