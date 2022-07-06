import 'package:evidencia2/helpers/iconhelper.dart';
import 'package:evidencia2/main.dart';
import 'package:evidencia2/widgets/iconfont.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  int duration = 0;
  Widget goToPage;

  SplashPage({required this.goToPage, required this.duration});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: this.duration), () {
      // Un FUTURE se utiliza para representar un valor potencial
      //o un error que estará disponible en algún momento en el futuro. Ideal para programación asíncrona en flutter
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) =>
                  this.goToPage))); // Para ir a la pagina de inicio
    });

    return Scaffold(
      body: Container(
          color: Colors.lightBlue[400],
          alignment: Alignment.center,
          child: IconFont(
              color: Colors.white, iconName: IconFontHelper.LOGO, size: 100)),
    );
  }
}
