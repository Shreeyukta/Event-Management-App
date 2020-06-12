
import 'package:flutter/material.dart';
import'package:flutter/cupertino.dart';

class EventPage extends StatefulWidget {
  
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override

  Widget build(BuildContext context) {
    var events=["Wedding","BrataBandha","Baby shower","Birthday"];
    var listItem=new ListView.builder(
      padding: EdgeInsets.all(5.0),
    
      itemExtent: 80.0,
     itemCount: events.length,
      itemBuilder: (BuildContext context,int index){
        return new ListTile(
        title: new Card(
      elevation: 5.0,
      child: new Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top: 10.0,bottom: 10.0,left: 20.0),
        child:Text(events[index]),
      ),
),
      onTap:(){
        showDialog(
          barrierDismissible: false,
          context: context,
           builder:(_)=>CupertinoAlertDialog(
            title: new Column(
              children: <Widget>[
                new Text("Events"),
                new Icon(
                  Icons.favorite_border,
                  color:Colors.red,
                ),
              ],
            ),
            content: new Text(events[index]),
            actions: <Widget>[
              FlatButton(onPressed:(){
                Navigator.of(context).pop();

              },
              child: new Text('OK'),),
            ],
          ),
        );
      } ,
        );
      }
    );
    return  Scaffold(
      body:listItem,
    );
  }
}