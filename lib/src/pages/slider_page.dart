import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100;
  bool _blockChange = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Slider Page'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
        children: [
          _crearSlider(),
          _crearCheckbox(),
          _crearSwitch(),
          Expanded(child: _crearImagen()),
        ],
      ),
      )
    );
  }
  
  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      //divisions: 20,
      value: _valorSlider, 
      min: 10,
      max: 400,
      onChanged: _blockChange? null: (valor){
        setState(() {
          _valorSlider = valor;
        });
      }
      );
  }
  
  Widget _crearImagen() {
    return Image(
      image: const NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Batman_%28black_background%29.jpg/220px-Batman_%28black_background%29.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain
      );
  }
  
  Widget _crearCheckbox() {
/*     return Checkbox(
      value: _blockChange, 
      onChanged: (valor){
        setState(() {
          _blockChange = valor?? true;
        });
      }
    ); */

    return CheckboxListTile(
      title: const Text('Bloquear slider'),
      value: _blockChange, 
      onChanged: (valor){
        setState(() {
          _blockChange = valor?? true;
        });
      }
    );
  }
  
  Widget _crearSwitch() {
    return SwitchListTile(
      title: const Text('Bloquear slider'),
      value: _blockChange, 
      onChanged: (valor){
        setState(() {
          _blockChange = valor?? true;
        });
      }
    );
  }
}