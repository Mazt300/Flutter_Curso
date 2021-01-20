import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/peliculas_providers.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  final peliculasprovider = new PeliculasProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Peliculas en cines'),
          backgroundColor: Colors.redAccent,
          //Poniendo botones de la barra principal superior
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search_rounded), onPressed: () {})
          ],
        ),
        body: Container(
          child: Column(
            children: <Widget>[_swiperTarjetas()],
          ),
        ));
    // body: SafeArea(
    //   child: Text('Hola Mundo!!!!!!!!!'),
    // ));
  }

  Widget _swiperTarjetas() {
    // peliculasprovider.getEnCines();
    // return CardSwiper(peliculas: [1, 2, 3, 4, 5]);

    return FutureBuilder(
      future: peliculasprovider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(peliculas: snapshot.data);
        } else {
          return Container(
              height: 400.0, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
