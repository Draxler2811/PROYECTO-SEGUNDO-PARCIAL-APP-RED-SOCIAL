import 'package:flutter/material.dart';
import 'package:redsocial/src/AgregarPost.dart';
import 'package:redsocial/src/PostModel.dart';

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
        title: Text("List Post"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
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
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
              child: Text('Agregar Post', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
            if (posts.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                      child: Card(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3, // Ajuste del flex para dar más espacio a la imagen
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  posts[index].imagen,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
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
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  posts.removeAt(index);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            else
              Text("No hay datos de publicación disponibles"),
          ],
        ),
      ),
    );
  }
}
