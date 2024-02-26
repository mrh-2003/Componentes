import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Page'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _cardTipo1(),
          const SizedBox(height: 30,),
          _cardTipo2(),
          
        ],
      ),
    );
  }
  
  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.photo_camera_sharp, color: Colors.amber,),
            title: Text('Soy el titulo de este list tile'),
            subtitle: Text('Este es un contenido aleatoreo que estoy poniendo en este card solo para demostrar que se puede hacer algo grande'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Ok'),
              )
            ],
          )
        ],
      ),
    );
  }
  Widget _cardTipo2() {
    final card =  Container(
      //clipBehavior: Clip.antiAlias, //sirve para que nada salga del card
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          const FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'), 
            image: NetworkImage('https://images.pexels.com/photos/346529/pexels-photo-346529.jpeg?cs=srgb&dl=pexels-bri-schneiter-346529.jpg&fm=jpg'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300,
            fit: BoxFit.cover,
          ),
          //const Image(image: NetworkImage('https://images.pexels.com/photos/346529/pexels-photo-346529.jpeg?cs=srgb&dl=pexels-bri-schneiter-346529.jpg&fm=jpg')),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text("No se que poner en ese texto"),
          )
        
        ],
      ),
    );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
          blurRadius: 10.0,
          color: Colors.black26,
          spreadRadius: 2.0, 
          offset: Offset(2, 10)
        )
        ]
      ),
      child: ClipRRect( 
        borderRadius: BorderRadius.circular(30),
        child: card,
      ),
    );
  }
}



