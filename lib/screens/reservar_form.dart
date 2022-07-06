import 'package:evidencia2/models/reservar.dart';
import 'package:evidencia2/providers/reservar_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ReservarFormScreen extends StatefulWidget {
  const ReservarFormScreen({Key? key}) : super(key: key);

  @override
  State<ReservarFormScreen> createState() => _ReservarFormScreen();
}

class _ReservarFormScreen extends State<ReservarFormScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final reservarProvider = Provider.of<ReservarProvider>(context);
    final txtnombre = TextEditingController();
    final txtespecialidad = TextEditingController();
    final txtseguro = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: Text('Rerservar Cita'),
          backgroundColor: Colors.lightBlue[400],
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background2.jpg'), fit: BoxFit.cover),
          ),
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Paciente",
                    hintText: "Nombre completo",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                controller: txtnombre,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Por favor ingrese un nombre";
                  }
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Seleccciona una especialidad",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                controller: txtespecialidad,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese un seguro';
                  }
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Selecciona un seguro",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                controller: txtseguro,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese una especialidad';
                  }
                },
              ),
              SizedBox(height: 20.0),
              Container(
                child: ElevatedButton(
                  child: const Text("GUARDAR"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Entrando..."),
                        backgroundColor: Color.fromRGBO(41, 182, 246, 1),
                      ));

                      var reservar = Reservar(
                        id: '',
                        pacienteId: 0,
                        nombre: txtnombre.text,
                        especialidad: txtespecialidad.text,
                        seguro: txtseguro.text,
                      );
                      reservarProvider.saveReservar(reservar);

                      Navigator.pushReplacementNamed(context, "ruta_reservar");
                    }
                  },
                ),
              ),
            ]),
          ),
        ));
  }
}
