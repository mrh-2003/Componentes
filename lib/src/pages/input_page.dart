import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = "";
  String _email = "";
  String _password = "";
  String _fecha = "";

  TextEditingController _inputFieldDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inputs de texto"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _crearInput(),
          const Divider(),
          _crearEmail(),
          const Divider(),
          _crearPassword(),
          const Divider(),
          _crearFecha(context),
          const Divider(),
          _crearPersona()
        ],
      ),
    );
  }
  
  Widget _crearInput() {

    return  TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.characters,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: "Nombre de la persona",
        labelText: "Nombre: ",
        helperText: "Solo es el nombre",
        suffixIcon: const Icon(Icons.accessibility),
        icon: const Icon(Icons.account_circle),

      ),
      onChanged: (valor){
        setState(() {
        _nombre = valor;
        });
      } ,
    );
  }
  
  Widget _crearPersona() {
    return ListTile(
      title: Text("Nombre es: $_nombre"),
      subtitle: Text("El email es: $_email $_password"),

    );
  }
  
  Widget _crearEmail() {
    return  TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: "Email de la persona",
        labelText: "Email: ",
        suffixIcon: const Icon(Icons.alternate_email),
        icon: const Icon(Icons.email),

      ),
      onChanged: (valor)=>
        setState(() {
        _email = valor;
        })
    );
  }
  
  Widget _crearPassword() {
    return  TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: "Contraseña de la persona",
        labelText: "Contraseña: ",
        suffixIcon: const Icon(Icons.lock),
        icon: const Icon(Icons.password),

      ),
      onChanged: (valor)=>
        setState(() {
        _password = valor;
        })
    );
  }
  
  Widget _crearFecha(BuildContext context) {
    return  TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: "Fecha de nacimiento",
        labelText: "Fecha: ",
        suffixIcon: const Icon(Icons.calendar_month),
        icon: const Icon(Icons.calendar_today),
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );


  }
  
  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context, 
      initialDate:  DateTime.now(),
      firstDate:  DateTime(2020), 
      lastDate:  DateTime(2025), 
      locale: const Locale('es', 'ES')
      );
    if(picked != null){
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }
}