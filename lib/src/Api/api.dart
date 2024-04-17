import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:redsocial/src/models/Morty.dart';
import 'package:http/http.dart' as http;

class api extends StatefulWidget {
  @override
  _apiState createState() => _apiState();
}

class _apiState extends State<api>{
  late Future<List<Morty>> _listadoGifs;

  Future<List<Morty>> _getGifs() async{
    final Uri url = Uri.parse("https://rickandmortyapi.com/api/character");
    final response = await http.get(url);
    List<Morty> gifs = [];

    if(response.statusCode == 200){
      String body = utf8.decode(response.bodyBytes);

      final jsonData = jsonDecode(body);
      for(var item in jsonData["results"]){
        gifs.add(Morty(item["name"], item["image"],item["status"],item["gender"]));
      }
      return gifs;
    } else {
      throw Exception("Fallo la conexión");
    }
  }

  @override
  void initState() {
    super.initState();
    _listadoGifs =  _getGifs();
  }

  void _regresar(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personajes de Rick y Morty', style: TextStyle(color: Colors.white),),
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          leading: IconButton( // Agregado el botón de regreso en el AppBar
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
          child: FutureBuilder(
            future: _listadoGifs,
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if(snapshot.hasError){
                print(snapshot.error);
                return Text("Error");
              } else {
                final data = snapshot.data!;
                return GridView.count(
                  crossAxisCount: 2,
                  children: _listGifs(data),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  List<Widget> _listGifs(List<Morty> data){
    List<Widget> gifs = [];
    for(var gif in data){
      gifs.add(Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Image.network(gif.image, fit: BoxFit.fill)),
            SizedBox(height: 8),
            Text("Nombre: ${gif.name}", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Estado: ${gif.status}"),
            Text("Género: ${gif.gender}")
          ]
        ),
      ));
    }
    return gifs;
  }
}
