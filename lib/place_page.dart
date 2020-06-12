import 'package:flutter/material.dart';

class PlacePage extends StatefulWidget {
  @override
  _PlacePageState createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: new AppBar(
        title: new Text("Home"),
        backgroundColor: Colors.pink.shade400,
      ),
      body: new Container(
      child:  ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
          Images(
            imageloc: 'assets/summit.jpg',
            imagecap: 'Party Palaces',
          ),
        ],
      ),
    ),
    );
  }
}

class Images extends StatelessWidget {
  final String imageloc;
  final String imagecap;
  Images({this.imageloc, this.imagecap});

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
              imageloc,
              width: 380.0,
              height: 280.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(imagecap, style: new TextStyle(fontSize: 22.0),),
            )
          ),
        ),
      ),
    );
  }
}


