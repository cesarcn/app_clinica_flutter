import 'package:evidencia2/helpers/iconhelper.dart';
import 'package:evidencia2/widgets/iconfont.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  createState() => _WelcomeScreen();
}

class _WelcomeScreen extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.black,
          child: Stack(
            children: [
              Positioned.fill(
                child: Opacity(
                  opacity: 0.9,
                  child:
                      Image.asset('assets/background.jpg', fit: BoxFit.cover),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: ClipOval(
                        child: Container(
                          width: 120,
                          height: 120,
                          color: Colors.lightBlue[300],
                          alignment: Alignment.center,
                          child: IconFont(
                            iconName: IconFontHelper.MAIN_LOGO,
                            color: Colors.white,
                            size: 60,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Bienvenido',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 40),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.lightBlue[400],
                      padding: EdgeInsets.symmetric(
                          horizontal: 85.0, vertical: 15.0),
                      child: Text(
                        'Iniciar sesión',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'ruta_login');
                      },
                    ),
                    SizedBox(height: 10),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.lightBlue[400],
                      padding: EdgeInsets.symmetric(
                          horizontal: 92.0, vertical: 15.0),
                      child: Text(
                        'Registrarse',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, 'ruta_registro_form');
                      },
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
