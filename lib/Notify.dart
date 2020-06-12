import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'mydata.dart';

class Notify extends StatefulWidget {
  @override
  _NotifyState createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
    // bool photographer = false;
  // bool extradecoration = false;
  List<Mydata> allData=[];
  
  @override
  void initState()
  {
    super.initState();
     DatabaseReference ref = FirebaseDatabase.instance.reference().child('node-name');
     ref.once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;
      allData.clear();
      for (var key in keys) {
        Mydata d = new Mydata(
          data[key]['Date'],
          data[key]['Destination'],
          data[key]['People'],
          data[key]['Time'],
          data[key]['Name'],
          data[key]['Contact'],
          data[key]['Event'],
        );
        allData.add(d);
      }
      setState(() {
        print('Length : ${allData.length}');
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Firebase Data'),
      ),
      body: new Container(
          child: allData.length == 0
              ? new Text(' No Data is Available')
              : new ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (_, index) {
                    return ui(
                      allData[index].date,
                      allData[index].destination,
                      allData[index].people,
                      allData[index].time,
                      allData[index].name,
                      allData[index].contact,
                      allData[index].event,
                      
                    );
                  },
                )),
    );
  }
 Widget ui(String date, String  destination, String people, String time, String name, String contact, String event) {
    return new Card(
      elevation: 10.0,
      child: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text('Venue : $destination',style: Theme.of(context).textTheme.title,),
            new Text('Date : $date'),
            new Text('People : $people'),
            new Text('Time : $time'),
            new Text('Name : $name'),
            new Text('Contact : $contact'),
            new Text('Event : $event'),
          ],
        ),
      ),
    );
  }


  }