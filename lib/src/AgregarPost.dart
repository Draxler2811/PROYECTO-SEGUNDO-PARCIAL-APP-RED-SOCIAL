import 'package:flutter/material.dart';
import 'package:redsocial/src/PostModel.dart';

class AgregarPost extends StatefulWidget {
  final String? nombreUsuario;

  const AgregarPost({Key? key, this.nombreUsuario}) : super(key: key);

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
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 20),
            Text(
              'Post',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Nombre:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.nombreUsuario ?? '',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            TextField(
              controller: descripcionController,
              decoration: InputDecoration(
                labelText: 'Descripción',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: lugarController,
              decoration: InputDecoration(
                labelText: 'Lugar',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: imagenController,
              decoration: InputDecoration(
                labelText: 'URL de la Imagen',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => agregarPost(context),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                  ),
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
