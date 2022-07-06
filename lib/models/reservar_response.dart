import 'dart:convert';

import 'package:evidencia2/models/reservar.dart';

class ReservarResponse {
  ReservarResponse({
    required this.reservar,
  });

  List<Reservar> reservar;

  factory ReservarResponse.fromJson(String str) =>
      ReservarResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReservarResponse.fromMap(Map<String, dynamic> json) =>
      ReservarResponse(
        reservar: List<Reservar>.from(
            json["reservar"].map((x) => Reservar.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "reservar": List<dynamic>.from(reservar.map((x) => x.toMap())),
      };
}
