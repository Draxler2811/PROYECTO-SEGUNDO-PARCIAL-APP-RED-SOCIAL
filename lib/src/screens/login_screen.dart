// LoginScreen
import 'package:flutter/material.dart';
import 'package:redsocial/src/ListPost.dart';
import 'package:redsocial/src/bloc/bloc.dart';

class LoginScreen extends StatelessWidget {
  final List<Map<String, String>> usuarios = [
    {'email': 'omar@gmail.com', 'password': 'omar1234', 'nombre': 'Omar'},
    {'email': 'pepe@gmail.com', 'password': 'pepe1234', 'nombre': 'Pepe'},
    {'email': 'fati@gmail.com', 'password': 'fati1234', 'nombre': 'Fati'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 3, 3, 3),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF6F2180), Colors.black],
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 8),
            Text(
              "Bienvenido",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 100),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Bienvenido a mi aplicación ProCalculator Omar Lozano",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 8),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  emailField(),
                  SizedBox(height: 16),
                  passwordField(),
                  SizedBox(height: 16),
                  submitButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'You@example.com',
            labelText: 'Email',
            errorText: snapshot.error != null ? snapshot.error.toString() : null,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(color: Colors.black),
            ),
            filled: true,
            fillColor: Colors.black,
            hintStyle: TextStyle(color: Colors.white),
            labelStyle: TextStyle(color: Colors.white),
          ),
          onChanged: bloc.changeEmail,
          style: TextStyle(color: Colors.white),
        );
      },
    );
  }

  Widget passwordField() {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          decoration: InputDecoration(
            labelText: 'Contraseña',
            hintText: 'Contraseña',
            errorText: snapshot.error != null ? snapshot.error.toString() : null,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(color: Colors.black),
            ),
            filled: true,
            fillColor: Colors.black,
            hintStyle: TextStyle(color: Colors.white),
            labelStyle: TextStyle(color: Colors.white),
          ),
          onChanged: bloc.changePassword,
          obscureText: true,
          style: TextStyle(color: Colors.white),
        );
      },
    );
  }

  Widget submitButton(BuildContext context) {
    return ElevatedButton(
      child: Text('Entrar', style: TextStyle(color: Colors.white),),
      onPressed: () {
        // Verificar si el correo electrónico y la contraseña coinciden con algún usuario
        bool usuarioValido = usuarios.any((usuario) =>
            usuario['email'] == bloc.currentEmail &&
            usuario['password'] == bloc.currentPassword);

        if (usuarioValido) {
          // Obtener el nombre del usuario
          String? nombreUsuario;
          for (var usuario in usuarios) {
            if (usuario['email'] == bloc.currentEmail &&
                usuario['password'] == bloc.currentPassword) {
              nombreUsuario = usuario['nombre'];
              break;
            }
          }

          // Navegar a la pantalla ListPost
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListPost(nombreUsuario: nombreUsuario)),
            
          );
        } else {
          // Si no coinciden, muestra un mensaje de error
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Usuario o contraseña incorrectos'),
            ),
          );
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
    );
  }
}
