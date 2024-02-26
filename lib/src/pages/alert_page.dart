import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: ()=> _mostrarAlert(context), 
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue), 
            foregroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(const StadiumBorder())
            ),
          
          child: const Text("Mostrar alerta"),
          ),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.earbuds_battery),
        onPressed: () => Navigator.pop(context),
      ),
      
    );
  }

  void _mostrarAlert(BuildContext context){
    showDialog(
      context: context, 
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          //shape: const BeveledRectangleBorder(),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text("Alerta"),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Este es el contenido expicito de mi app"),
              FlutterLogo(size: 100,),

            ],
          ),
          actions: [
            TextButton(
              onPressed: ()=> Navigator.of(context).pop(), 
              child: const Text("Cancelar")),
              TextButton(
              onPressed: (){}, 
              child: const Text("OK"))
          ],
          

        );
      },
      
      );
  }
} 