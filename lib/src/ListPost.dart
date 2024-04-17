import 'package:flutter/material.dart';
import 'package:redsocial/src/AgregarPost.dart';
import 'package:redsocial/src/PostModel.dart';
import 'package:redsocial/src/Api/api.dart';

class ListPost extends StatefulWidget {
  final String? nombreUsuario; // Parámetro para recibir el nombre del usuario

  const ListPost({Key? key, this.nombreUsuario}) : super(key: key);

  @override
  _ListPostState createState() => _ListPostState();
}

class _ListPostState extends State<ListPost> {
  List<Post> posts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Post", style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromARGB(255, 44, 42, 42),
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
          padding: const EdgeInsets.only(top: 100.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (posts.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                        child: Container(
                          width: double.infinity,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Stack(
                                children: [
                                  // Contenedor para la imagen
                                  Container(
                                    width: 200, // Ancho fijo para la imagen
                                    height: 200, // Altura fija para la imagen
                                    child: Image.network(
                                      posts[index].imagen,
                                      fit: BoxFit.cover, // Ajustar la imagen para cubrir el contenedor
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        // Texto
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.nombreUsuario ?? '',
                                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 8),
                                            Text(
                                              posts[index].descripcion,
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            SizedBox(height: 8),
                                            Text(
                                              posts[index].lugar,
                                              style: TextStyle(fontSize: 14, color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 150, // Ajusta la posición del botón de eliminar
                                    right: 160, // Ajusta el botón de eliminar hacia la derecha
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          posts.removeAt(index);
                                        });
                                      },
                                      child: Text(
                                        'Eliminar',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              else
                Center(
                  child: Text(
                    "No hay datos de publicación disponibles",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 16.0,
              bottom: 550.0, // Ajusta la posición del botón flotante
            ),
            child: FloatingActionButton(
              onPressed: () async {
                // Navegar a la pantalla AgregarPost y esperar el resultado
                final nuevoPost = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AgregarPost(nombreUsuario: widget.nombreUsuario)),
                );

                // Agregar el nuevo post a la lista si no es nulo
                if (nuevoPost != null) {
                  setState(() {
                    posts.add(nuevoPost);
                  });
                }
              },
              child: Icon(Icons.add),
              backgroundColor: const Color.fromARGB(255, 68, 255, 211),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 150.0,
              bottom: 16.0, // Ajusta la posición del nuevo botón flotante
            ),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => api()),
                );
              },
              child: Text(
                "API",
                style: TextStyle(fontSize: 18),
              ),
              backgroundColor: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}
