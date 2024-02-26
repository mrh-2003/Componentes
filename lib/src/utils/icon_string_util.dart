import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'folder_open': Icons.folder_open,
  'accessibility': Icons.accessibility,
  'add_alert': Icons.add_alert,
  'zoom_out': Icons.zoom_out,
  'donut_large': Icons.donut_large,
  'input': Icons.input,
};

Icon getIcon(String nombre){
  return Icon(_icons[nombre], color: Colors.blue,);
}