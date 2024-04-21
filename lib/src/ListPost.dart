import 'package:flutter/material.dart';
import 'package:redsocial/src/AgregarPost.dart';
import 'package:redsocial/src/Api/api.dart';
import 'package:redsocial/src/PostModel.dart';

class ListPost extends StatefulWidget {
  final String? nombreUsuario;

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
        title: Text("TECBOOK", style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
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
                        child: SizedBox(
                          width: double.infinity,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 120, // Ajusta el ancho del contenedor
                                        height: 100,
                                        margin: EdgeInsets.only(right: 10), // Agrega un margen a la derecha
                                        child: Image.network(
                                          posts[index].imagen,
                                          fit: BoxFit.cover,
                                          loadingBuilder: (context, child, loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            } else {
                                              return CircularProgressIndicator();
                                            }
                                          },
                                          errorBuilder: (context, error, stackTrace) {
                                            return Text('Error al cargar la imagen');
                                          },
                                        ),
                                      ),
                                      // Contenedor para el texto
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: Text(
                                                widget.nombreUsuario ?? '',
                                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Center(
                                              child: Text(
                                                posts[index].descripcion,
                                                style: TextStyle(fontSize: 16),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Center(
                                              child: Text(
                                                posts[index].lugar,
                                                style: TextStyle(fontSize: 14, color: Colors.grey),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          posts.removeAt(index);
                                        });
                                      },
                                      child: Text(
                                        "Eliminar",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
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
              bottom: 550.0,
            ),
            child: FloatingActionButton(
              onPressed: () async {
                final nuevoPost = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AgregarPost(nombreUsuario: widget.nombreUsuario)),
                );
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
              bottom: 16.0,
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
