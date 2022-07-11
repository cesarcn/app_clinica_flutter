import 'dart:io';
import 'package:evidencia2/models/pagos.dart';
import 'package:evidencia2/models/pagos_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PagosProvider extends ChangeNotifier {
  String _baseUrl = 'clinica-api-rest.herokuapp.com';

  List<Pago> listaPagos = [];

  PagosProvider() {
    print('Ingresando a PagosProvider');
    this.getOnPagosList();
  }

  getOnPagosList() async {
    var url = Uri.http(_baseUrl, '/api/pagos', {});
    final response = await http.get(url);
    print(response.body);
    final pagosResponse = PagosResponse.fromJson(response.body);
    listaPagos = pagosResponse.pagos;
    notifyListeners();
  }

  savePagos(Pago pagos) async {
    var url = Uri.http(_baseUrl, '/api/pagos/save');
    print(pagos.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: pagos.toJson());
    print(response.body);
    getOnPagosList();
    notifyListeners();
  }
}
