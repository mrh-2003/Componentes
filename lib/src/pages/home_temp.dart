/* import 'package:flutter/material.dart';


class HomePageTemp extends StatelessWidget {
  
  final opciones = ['uno', 'dos', 'tres', 'cuatro', 'cinco'];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List view', style: TextStyle(fontSize: 16),),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: _crearItemsMap(),
      ),
      );
  }

/*   List<Widget> _crearItems(){
    List<Widget> items = [];
    for (var opt in opciones) {
      final listTemp =  ListTile(title: Text(opt),);
      items..add(listTemp)
            ..add(Divider(color: Colors.amber,));
    }
    return items;
  } */
  List<Widget> _crearItemsMap(){
    return opciones.map((e){
      return Column(
        children: [
          ListTile(
            title: Text(e),
            tileColor: Colors.pink,
            subtitle: const Text('Este es un subtitle'),
            leading: const Icon(Icons.heart_broken),
            trailing: const Icon(Icons.skip_next),
            onTap: (){},
          ),
          const Divider(color: Colors.black, height: 5,)
        ],
      );
    }).toList();
  }
} */