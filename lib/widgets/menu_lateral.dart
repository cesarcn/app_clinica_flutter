import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.lightBlue[50],
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            child: Text(''),
            decoration: BoxDecoration(
                color: Color.fromRGBO(129, 212, 250, 1),
                image: DecorationImage(
                    image: AssetImage('assets/clinica.png'),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            iconColor: Colors.lightBlue[600],
            leading: Icon(Icons.home),
            title: const Text('Principal'),
            hoverColor: Colors.lightBlue[100],
            textColor: Colors.black,
            onTap: () {
              Navigator.pushNamed(context, 'ruta_principal');
            },
          ),
          ListTile(
            iconColor: Colors.lightBlue[600],
            leading: Icon(Icons.calendar_month),
            title: const Text('Citas'),
            hoverColor: Colors.lightBlue[100],
            textColor: Colors.black,
            onTap: () {
              Navigator.pushNamed(context, 'ruta_reservar');
            },
          ),
          ListTile(
            iconColor: Colors.lightBlue[600],
            leading: Icon(Icons.assignment_ind_outlined),
            title: const Text('Historial'),
            hoverColor: Colors.lightBlue[100],
            textColor: Colors.black,
            onTap: () {
              Navigator.pushNamed(context, 'ruta_historial');
            },
          ),
          ListTile(
            iconColor: Colors.lightBlue[600],
            leading: Icon(Icons.payment),
            title: const Text('Pagos'),
            hoverColor: Colors.lightBlue[100],
            textColor: Colors.black,
            onTap: () {
              Navigator.pushNamed(context, 'ruta_pagos');
            },
          ),
          ListTile(
            iconColor: Colors.lightBlue[600],
            leading: Icon(Icons.bar_chart),
            title: const Text('Reportes'),
            hoverColor: Colors.lightBlue[100],
            textColor: Colors.black,
            onTap: () {
              Navigator.pushNamed(context, 'ruta_reporte');
            },
          ),
          Divider(),
          ListTile(
            iconColor: Colors.lightBlue[600],
            leading: Icon(Icons.logout),
            title: const Text('Cerrar sesión'),
            hoverColor: Colors.lightBlue[100],
            textColor: Colors.black,
            onTap: () {
              Navigator.pushNamed(context, 'ruta_splash');
            },
          ),
        ],
      ),
    );
  }
}
