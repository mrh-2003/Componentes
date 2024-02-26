import 'package:flutter/material.dart';
import 'dart:async';
class Listpage extends StatefulWidget {
  const Listpage({super.key});

  @override
  State<Listpage> createState() => _ListpageState();
}

class _ListpageState extends State<Listpage> {
  List<int> _listaNumeros =[];
  int _ultimoItem = 0;
  bool isLoading = false;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        //_agregar10();
        fetchData();
      }
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista"),
      ),
      body: Stack(
        children: [
          _crearLista(),
          _crearLoading()
        ],
      ),
    );
  }

  Widget _crearLista(){
    return RefreshIndicator(
      onRefresh: _obtenerPagina1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index){
          final imagen = _listaNumeros[index];
          return FadeInImage(
            placeholder: const AssetImage('assets/jar-loading.gif'), 
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
            );
        }
        ),
    );
  }

  void _agregar10(){
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {
      
    });
  }
  
  Future fetchData() async{
    isLoading = true;
    setState(() {});
    const duracion = Duration(seconds: 2);
    return Timer(duracion, respuestaHTTP);
  }
  void respuestaHTTP(){
    isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels +100,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 250)
    );
    _agregar10();
  }
  
  Widget _crearLoading() {
    if(isLoading){
      return const Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 15,)
        ],
      );
      
      
    }
    return Container();
  }
  
  Future _obtenerPagina1() async {
    const duracion = Duration(seconds: 2);
    Timer(duracion, (){
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });
    return Future.delayed(duracion);
  }
}