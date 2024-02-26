import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icon_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes'),
      ),
      body: _lista(),
    );
  }
  
  Widget _lista() {

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: const [],
      builder:(context, AsyncSnapshot<List<dynamic>> snapshot ) {
      return ListView(
        children: _crearItems(snapshot.data ?? [], context),
      );
    },);
  }
  
  List<Widget> _crearItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
    data.forEach((element) {
      final temp = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue,),
        onTap: () {
          /* final route = MaterialPageRoute(builder: (context) => const AlertPage());
          Navigator.push(context, route); */
          Navigator.pushNamed(context, element['ruta']);
        },
      );
      opciones..add(temp)
              ..add(const Divider(color: Colors.purple,));
    });
    return opciones;
  }
}