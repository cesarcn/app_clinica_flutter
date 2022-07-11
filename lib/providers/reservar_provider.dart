import 'dart:io';

import 'package:evidencia2/models/reservar.dart';
import 'package:evidencia2/models/reservar_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReservarProvider extends ChangeNotifier {
  String _baseUrl = 'clinica-api-rest.herokuapp.com';

  List<Reservar> listaReservar = [];

  ReservarProvider() {
    print('Ingresando a ReservarProvider');
    this.getOnReservarList();
  }

  getOnReservarList() async {
    var url = Uri.http(_baseUrl, '/api/reserva', {});
    final response = await http.get(url);
    print(response.body);
    final reservarResponse = ReservarResponse.fromJson(response.body);
    listaReservar = reservarResponse.reservar;
    notifyListeners();
  }

  saveReservar(Reservar reservar) async {
    var url = Uri.http(_baseUrl, '/api/reserva/save');
    print(reservar.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: reservar.toJson());
    print(response.body);
    getOnReservarList();
    notifyListeners();
  }
}
