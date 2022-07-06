import 'dart:convert';

class Reservar {
    Reservar({
        required this.id,
        required this.pacienteId,
        required this.nombre,
        required this.especialidad,
        required this.seguro,
    });

    String id;
    int pacienteId;
    String nombre;
    String especialidad;
    String seguro;

    factory Reservar.fromJson(String str) => Reservar.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Reservar.fromMap(Map<String, dynamic> json) => Reservar(
        id: json["_id"],
        pacienteId: json["pacienteId"],
        nombre: json["nombre"],
        especialidad: json["especialidad"],
        seguro: json["seguro"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "pacienteId": pacienteId,
        "nombre": nombre,
        "especialidad": especialidad,
        "seguro": seguro,
    };
}