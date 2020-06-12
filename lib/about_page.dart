import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  static String tag = 'about-page';

  @override
  Widget build(BuildContext context) {
    final event = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/yozana.jpg'),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Welcome ',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final events = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'YOZANA-Your Event Planner is a application which act as a bridge between users and event planners. As people spend lots of money and time for booking events, parties and weddings and any other functions. By this application the time of the user reduces because they can access any information related to event address/venue/hall. ',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.pink.shade200,
          Colors.pinkAccent.shade200,
        ]),
      ),
      child: Column(
        children: <Widget>[event, welcome,events],
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}