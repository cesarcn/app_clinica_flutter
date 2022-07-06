import 'package:evidencia2/models/pagos.dart';
import 'package:evidencia2/providers/pagos_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:provider/provider.dart';

class PagosFormScreen extends StatefulWidget {
  const PagosFormScreen({Key? key}) : super(key: key);

  @override
  State<PagosFormScreen> createState() => _PagosFormScreen();
}

enum Categorias { particular, privado }

class _PagosFormScreen extends State<PagosFormScreen> {
  final _formKey = GlobalKey<FormState>();
  Categorias? _catSeleccion = Categorias.particular;
  bool? _estadoActivo = false;

  @override
  Widget build(BuildContext context) {
    final pagosProvider = Provider.of<PagosProvider>(context);

    final txtNomUsuario = TextEditingController();
    final txtNumTarje = TextEditingController();
    final txtfecha = TextEditingController();
    final txtclave = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[400],
        title: Text('REGISTRO DE PAGOS'),
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
              //maxLines: 8,
              //maxLength: 50,
              decoration: InputDecoration(
                  labelText: 'Nombre y Apellido',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              controller: txtNomUsuario,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingrese una descripcion';
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [MaskedInputFormatter('#### #### #### ####')],
                decoration: InputDecoration(
                    labelText: '0000 0000 0000 0000',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                controller: txtNumTarje,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese una descripcion';
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 150,
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [MaskedInputFormatter('##/##')],
                decoration: InputDecoration(
                    labelText: '00/00',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                controller: txtfecha,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ' ingrese su Fecha';
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 150,
              alignment: Alignment.centerLeft,
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'cvv',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                controller: txtclave,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'ingrese el cvv';
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Text('Categoria:'),
                SizedBox(
                  width: 20,
                ),
                Radio(
                    value: Categorias.particular,
                    groupValue: _catSeleccion,
                    onChanged: (value) {
                      setState(() {
                        _catSeleccion = value as Categorias?;
                        print(_catSeleccion);
                      });
                    }),
                Text('Débito'),
                SizedBox(
                  width: 15,
                ),
                Radio(
                    value: Categorias.privado,
                    groupValue: _catSeleccion,
                    onChanged: (value) {
                      setState(() {
                        _catSeleccion = value as Categorias?;
                        print(_catSeleccion);
                      });
                    }),
                Text('Crédito'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: ElevatedButton(
                child: const Text('PAGAR'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Validando...')));

                    var pagos = Pago(
                        id: '',
                        pagoId: 0,
                        NomUsuario: txtNomUsuario.text,
                        NumTarje: txtNumTarje.text,
                        fecha: txtfecha.text,
                        clave: int.parse(txtclave.text));

                    pagosProvider.savePagos(pagos);

                    Navigator.pushReplacementNamed(context, 'ruta_pagos');
                  }
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
