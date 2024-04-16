import 'package:flutter/material.dart';
import 'package:redsocial/src/AgregarPost.dart';
import 'package:redsocial/src/PostModel.dart';
class ListPost extends StatefulWidget {
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
                  MaterialPageRoute(builder: (context) => AgregarPost()),
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
                    return ListTile(
                      title: Text(posts[index].descripcion),
                      subtitle: Text(posts[index].lugar),
                      leading: Image.network(
                        posts[index].imagen,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
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
