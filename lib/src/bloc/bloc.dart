import 'dart:async';
import 'package:flutter/material.dart';
import 'package:redsocial/src/bloc/validators.dart';

class Bloc with Validators {
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();
  
  // Variables para almacenar los valores actuales del correo electrónico y la contraseña
  String _currentEmail = '';
  String _currentPassword = '';

  Stream<String> get email => _emailController.stream.transform(ValidaEmail);
  Stream<String> get password => _passwordController.stream.transform(ValidaPassword);

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // Getter para obtener el valor actual del correo electrónico
  String get currentEmail => _currentEmail;

  // Getter para obtener el valor actual de la contraseña
  String get currentPassword => _currentPassword;

  // Constructor para inicializar las variables actuales del correo electrónico y la contraseña
  Bloc() {
    _emailController.stream.listen((email) => _currentEmail = email);
    _passwordController.stream.listen((password) => _currentPassword = password);
  }

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

var bloc = Bloc();
