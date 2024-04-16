import 'package:flutter/material.dart';
import 'package:redsocial/src/PostModel.dart';

class AgregarPost extends StatefulWidget {
  @override
  _AgregarPostState createState() => _AgregarPostState();
}

class _AgregarPostState extends State<AgregarPost> {
  TextEditingController descripcionController = TextEditingController();
  TextEditingController lugarController = TextEditingController();
  TextEditingController imagenController = TextEditingController();

  void agregarPost(BuildContext context) {
    String descripcion = descripcionController.text;
    String lugar = lugarController.text;
    String imagen = imagenController.text;

    Post nuevoPost = Post(descripcion: descripcion, lugar: lugar, imagen: imagen);

    // Enviar el nuevo post de vuelta a la pantalla anterior
    Navigator.pop(context, nuevoPost);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agregar Post"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: descripcionController,
              decoration: InputDecoration(labelText: 'Descripción'),
            ),
            SizedBox(height: 12),
            TextField(
              controller: lugarController,
              decoration: InputDecoration(labelText: 'Lugar'),
            ),
            SizedBox(height: 12),
            TextField(
              controller: imagenController,
              decoration: InputDecoration(labelText: 'URL de la Imagen'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => agregarPost(context),
              child: Text('Agregar'),
            ),
          ],
        ),
      ),
    );
  }
}
