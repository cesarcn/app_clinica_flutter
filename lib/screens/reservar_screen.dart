import 'dart:ui';
import 'package:evidencia2/models/reservar.dart';
import 'package:evidencia2/providers/reservar_provider.dart';
import 'package:evidencia2/widgets/menu_lateral.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class ReservarScreen extends StatefulWidget {
  @override
  createState() => _ReservarScreen();
}

class _ReservarScreen extends State<ReservarScreen> {
  @override
  Widget build(BuildContext context) {
    final reservarProvider = Provider.of<ReservarProvider>(context);
    final List<Reservar> listaReservar = reservarProvider.listaReservar;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Reservas"),
        backgroundColor: Colors.lightBlue[400],
      ),
      drawer: const MenuLateral(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background2.jpg'), fit: BoxFit.cover),
        ),
        child: Center(
            child: ListView.builder(
          itemCount: listaReservar.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(listaReservar[index].nombre,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue)),
              subtitle: Text(listaReservar[index].especialidad.toString(),
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              leading: Icon(Icons.person),
            );
          },
        )),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'ruta_reservar_form');
        },
        backgroundColor: Colors.blue,
      ),
    );
  }
}
