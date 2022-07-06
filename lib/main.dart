import 'package:evidencia2/providers/pagos_provider.dart';
import 'package:evidencia2/providers/reservar_provider.dart';
import 'package:evidencia2/providers/usuario_provider.dart';
import 'package:evidencia2/screens/login_clinica.dart';
import 'package:evidencia2/screens/pagos_form_screen.dart';
import 'package:evidencia2/screens/pagos_screen.dart';
import 'package:evidencia2/screens/principal_screen.dart';
import 'package:evidencia2/screens/registro_form_screen.dart';
import 'package:evidencia2/screens/reporte_screen.dart';
import 'package:evidencia2/screens/reservar_form.dart';
import 'package:evidencia2/screens/reservar_screen.dart';
import 'package:evidencia2/screens/welcome.dart';
import 'package:evidencia2/widgets/welcome_wid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'POS APP',
      initialRoute: 'ruta_login', // POR DEFECTO LLAMA A LA RUTA LOGIN
      routes: {
        'ruta_login': (_) => LoginClinica(),
        'ruta_principal': (_) => PrincipalScreen(),
        'ruta_registro_form': (_) => RegistroFormScreen(),
      },
    );*/
    return MultiProvider(
      // MultiProvider es un widget que permite que se puedan tener varios providers en una sola aplicación
      providers: [
        ChangeNotifierProvider(
          create: (_) => UsuarioProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => PagosProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ReservarProvider(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(
          duration: 3,
          goToPage: WelcomeScreen(),
        ),
        title: 'POS APP',
        initialRoute: 'ruta_splash',
        routes: {
          'ruta_splash': (_) => SplashPage(
                duration: 3,
                goToPage: WelcomeScreen(),
              ),
          //'ruta_welcome': (_) => WelcomeScreen(),
          'ruta_login': (_) => LoginClinica(),
          'ruta_principal': (_) => PrincipalScreen(),
          // 'ruta_principal': (_) => PrincipalGridList(),
          'ruta_registro_form': (_) => RegistroFormScreen(),
          'ruta_reporte': (_) => ReportScreen(),
          'ruta_pagos': (_) => PagosScreen(),
          'ruta_pagos_form': (_) => PagosFormScreen(),
          'ruta_reservar': (_) => ReservarScreen(),
          'ruta_reservar_form': (_) => ReservarFormScreen(),
        },
      ),
    );
  }
}
