import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class DataSearch extends SearchDelegate {

  String seleccion = '';

  final peliculasProvider = new PeliculasProvider();

  final peliculas = [
    'Spiderman',
    'Iron Man',
    'Capitán América',
    'Inception',
    'Batman',
    'Shazam!'
  ];

  final peliculasRecientes = [
    'Sipderman',
    'Iron Man'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
      // Las acciones de nuestro AppBar
      return [
        IconButton(
          icon: Icon(Icons.clear), 
          onPressed: (){
            query = '';
          },
        )
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      // Ícono a la izquierda del AppBar
      return IconButton(
        icon: AnimatedIcon(
          progress: transitionAnimation,
          icon: AnimatedIcons.menu_arrow,
          ), 
        onPressed: () {
          close(context, null);
        },
      );
    }
  
    // @override
    // Widget buildResults(BuildContext context) {
    //   // Crea los resultados que vamos a mostrar
    //   return Center(
    //     child: Container(
    //       height: 100.0,
    //       width: 100.0,
    //       color: Colors.blueAccent,
    //       child: Text(seleccion),
    //     )
    //   );
    // }
  
  //   @override
  //   Widget buildSuggestions(BuildContext context) {
  //   // Son las sugerencias que van apareciendo al escribir 

  //   final listaSugerida = (query.isEmpty)
  //                           ? peliculasRecientes
  //                           : peliculas.where(
  //                             (p) => p.toLowerCase().startsWith(query.toLowerCase())
  //                           ).toList();
  //   return ListView.builder(
  //     itemCount: listaSugerida.length,
  //     itemBuilder: (context, i){
  //       return ListTile(
  //         leading: Icon(Icons.movie),
  //         title: Text(listaSugerida[i]),
  //         onTap: (){
  //           seleccion = listaSugerida[i];
  //            showResults(context);
  //         },
  //       );
  //     }
  //   );
  // }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
    if(query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      future: peliculasProvider.buscarPelicula(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {

        if(snapshot.hasData){

          final peliculas = snapshot.data;
          return ListView(
            children: peliculas.map((pelicula) {
              return ListTile(
                leading: FadeInImage(
                  placeholder: AssetImage('assets/img/no-image.jpg'), 
                  image: NetworkImage(pelicula.getPosterImg()),
                  width: 50.0,
                  fit: BoxFit.contain,
                ),
                title: Text(pelicula.title),
                subtitle: Text(pelicula.originalTitle),
                onTap: (){
                  close(context, null);
                  pelicula.uniqueId = '';
                  Navigator.pushNamed(context, 'detalle', arguments: pelicula);
                },
              );
            }).toList()
          );
        }else{
          return Center(
            child: CircularProgressIndicator()
          );
        }

      },
    );
  }

}