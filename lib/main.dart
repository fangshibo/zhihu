import 'package:flutter/material.dart';
import './index/index.dart';

void main()=>runApp(Zhihu());

class Zhihu extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return MaterialApp(
        title: '知乎高信版',
        home: Index(),
      );
    }
}