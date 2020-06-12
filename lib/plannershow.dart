import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:yozana/dataplanner.dart';


class ShowDataPage extends StatefulWidget {
  @override
  _ShowDataPageState createState() => _ShowDataPageState();
}

class _ShowDataPageState extends State<ShowDataPage> {
  List<DataPlanner> allData = [];

  @override
  void initState() {
    super.initState();
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    ref.child('planner-name').once().then((DataSnapshot snap) {
          var keys = snap.value.keys;
          var data = snap.value;
          allData.clear();
          for (var key in keys) {
            DataPlanner d = new DataPlanner(
              data[key]['name'],
              data[key]['phone'],
              data[key]['address'],
              data[key]['people'],
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
            title: new Text('Show Data'),
          ),
          body: new Container(
              child: allData.length == 0
                  ? new Text(' No Data is Available')
                  : new ListView.builder(
                      itemCount: allData.length,
                      itemBuilder: (_, index) {
                        return ui(
                          allData[index].name,
                          allData[index].phone,
                          allData[index].address,
                          allData[index].people,
                        );
                      },
                    )),
        );
      }
    
      Widget ui(String name, String phone, String address,String people) {
        return new Card(
          elevation: 10.0,
          child: new Container(
            padding: new EdgeInsets.all(20.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text('Name : $name',style: Theme.of(context).textTheme.title,),
                new Text('Phone number : $phone'),
                new Text('Address : $address'),
                new Text('People : $people'),
              ],
            ),
          ),
        );
      }
    }
