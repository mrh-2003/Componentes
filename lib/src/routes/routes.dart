import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/animated_container_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/input_page.dart';
import 'package:componentes/src/pages/listview_page.dart';
import 'package:componentes/src/pages/slider_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes(){
  return {
        '/':(context) => const HomePage(),
        'alert':(context) => const AlertPage(),
        AvatarPage.pageName:(context) => const AvatarPage(),
        'card':(context) => const CardPage(),
        'animatedContainer':(context) => const AnimatedContainerPage(),
        'inputs':(context) => const InputPage(),
        'slider':(context) => const SliderPage(),
        'lists':(context) => const Listpage(),
      };
}