import 'package:flutter/material.dart';

import 'screen1.dart';

class Screen2 extends StatelessWidget {
  final Item item;

  const Screen2({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hero Animation"),
          centerTitle: true,
        ),
        body: Hero(
          transitionOnUserGestures: true,
          tag: item, child: buildImage()));
  }

  Widget buildImage() => AspectRatio(
        aspectRatio: 1,
        child: Image.network(
          item.urlImage,
          fit: BoxFit.cover,
          width: 240,
          height: 240,
        ),
      );
}
