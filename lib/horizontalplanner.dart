import 'package:flutter/material.dart';

class Horizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            imagelocation: 'assets/photographers.webp',
            imagecaption: 'shirt',
          ),

          Category(
            imagelocation: 'assets/photographers.webp',
            imagecaption: 'dress',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imagelocation;
  final String imagecaption;

  Category({this.imagelocation, this.imagecaption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 380.0,
          child: ListTile(
            title: Image.asset(
              imagelocation,
              width: 160.0,
              height: 180.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(imagecaption, style: new TextStyle(fontSize: 12.0),),
            )
          ),
        ),
      ),
    );
  }
}
