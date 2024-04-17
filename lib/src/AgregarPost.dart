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

    Navigator.pop(context, nuevoPost);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agregar Post", style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        leading: IconButton( // Agregado el botón de regreso en el AppBar
          icon: Icon(Icons.arrow_back, color: Colors.white), // Cambiado el color del icono a blanco
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF6F2180), Colors.black],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Text(
                'Post',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                'Nombre:',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                widget.nombreUsuario ?? '',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 20),
              TextField(
                controller: descripcionController,
                decoration: InputDecoration(
                  labelText: 'Descripción',
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 12),
              TextField(
                controller: lugarController,
                decoration: InputDecoration(
                  labelText: 'Lugar',
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 12),
              TextField(
                controller: imagenController,
                decoration: InputDecoration(
                  labelText: 'URL de la Imagen',
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => agregarPost(context),
                child: Text('Agregar',style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
