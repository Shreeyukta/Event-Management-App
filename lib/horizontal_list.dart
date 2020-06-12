import 'package:flutter/material.dart';

class HorizontalList extends StatefulWidget {
  @override
  _HorizontalListState createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
         Category(

            imagelocation: 'assets/wedding.jpg',
            imagecaption: 'Wedding',
          ),

          Category(
            imagelocation: 'assets/baby.jpg',
            imagecaption: 'Baby Shower',
          ),

          Category(
            imagelocation: 'assets/birthday.jpg',
            imagecaption: 'Birthday',
          ),
           Category(
            imagelocation: 'assets/rice.png',
            imagecaption: 'Rice Feeding',
          ),


          Category(
            imagelocation: 'assets/bratabandha.jpg',
            imagecaption: 'Bratabandha',
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
        onTap: () {
          Navigator.pushNamed(context, "/BookOne");
        },
        child: Container(
          padding: const EdgeInsets.all(2.0),
          width: 400.0,
          child: ListTile(
            title: Image.asset(
              imagelocation,
              width: 380.0,
              height: 280.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(imagecaption, style: new TextStyle(fontSize: 22.0),),
            )
          ),
        ),
      ),
    );
  }
}
