import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({super.key});

  @override
  State<AnimatedContainerPage> createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),

      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(borderRadius: _borderRadius, color: _color),
          duration: const Duration(seconds: 1),
          curve: Curves.bounceInOut,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeShape,
        child: const Icon(Icons.play_arrow),

      ),
    );
  }

  void _changeShape() {
    final random = Random();
    setState(() {
          _color = Color.fromRGBO(
      random.nextInt(250), 
      random.nextInt(250), 
      random.nextInt(250), 
      1);
    _width = random.nextInt(300).toDouble();
    _height = random.nextInt(300).toDouble();
    _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });

  }
}