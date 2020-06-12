//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yozana/horizontal_list.dart';
class HomeOne extends StatefulWidget {
  
  @override
  _HomeOneState createState() => _HomeOneState();
}

class _HomeOneState extends State<HomeOne> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
       body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Book Now"),
              background: Image.asset(
                'assets/events.jpg',
                fit: BoxFit.fill,
      
              ),
            ),
          ),
          SliverFillRemaining(child: ListView(
            scrollDirection: Axis.vertical,
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

          ),
        ],
      ),
      );
  }
      
}
  
