import 'package:flutter/material.dart';

class LoginClinica extends StatefulWidget {
  @override
  createState() => _LoginClinica();
}

class _LoginClinica extends State<LoginClinica> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: Text('Clinica Acoba'),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Flexible(
              //   //que sea responsive
              //   //Al momento de escribir, se acomode la pantalla con el teclado
              //   child: Image.asset(
              //     'assets/clinica.png',
              //     alignment: Alignment.center,
              //     height: 100.0,
              //   ),
              // ),
              SizedBox(
                //para un espacio de separacion
                height: 15.0,
              ),
              _userTextFormField(), //esto es como un metodo de manera privada, luego pasamos por encima para crear metodo
              SizedBox(
                height: 15.0,
              ),
              _passwordTextFormField(),
              SizedBox(
                height: 15.0,
              ),
              _bottonRecuperar(),
              SizedBox(
                height: 10.0,
              ),
              _bottonLogin(),
              SizedBox(
                height: 15.0,
              ),
              // _bottonRegistro(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userTextFormField() {
    final txtUser = TextEditingController();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.person),
          hintText: 'Ingrese su correo',
          labelText: 'Correo',
        ),
        controller: txtUser,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Por favor, ingrese su correo';
          }
        },
      ),
    );
  }

  Widget _passwordTextFormField() {
    final txtPass = TextEditingController();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.lock_outline),
          hintText: 'Ingrese su contraseña',
          labelText: 'Contraseña',
        ),
        controller: txtPass,
        validator: (value) {
          if (value!.length < 3) {
            return 'La contraseña debe tener mínimo 3 caracteres';
          } else {
            return null;
          }
        },
      ),
    );
  }

  _bottonRecuperar() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
          color: Colors.lightBlue[300],
          child: Text(
            '¿Olvidaste tu contraseña?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {},
        );
      },
    );
  }

  Widget _bottonLogin() {
    return StreamBuilder(
        //Este widget básicamente hace clickeable cualquier área.
        //Escucha los cambios en su respectivo objeto.
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      //use raisedbutton, ya que es el button por defecto que hay en android.
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text(
              'Iniciar sesión',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10.0,
          color: Colors.lightBlue[400],
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Navigator.pushReplacementNamed(context, 'ruta_principal');
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Ingresando...'),
                backgroundColor: Color.fromRGBO(41, 182, 246, 1),
              ));
            }
          });
    });
  }
}

//   _bottonRegistro() {
//     return StreamBuilder(
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//       return RaisedButton(
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 85.0, vertical: 15.0),
//             child: Text(
//               'Registrarse',
//               style: TextStyle(
//                 fontSize: 16.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           elevation: 10.0,
//           color: Colors.green[300],
//           onPressed: () {
//             Navigator.pushReplacementNamed(context, 'ruta_registro_form');
//           });
//     });
//   }
// }
