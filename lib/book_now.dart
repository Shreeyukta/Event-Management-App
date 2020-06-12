import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import'dart:async';


class BookNow extends StatefulWidget {
  static String tag = 'Book-Now';
  @override
  State<StatefulWidget> createState() {
    return new BookNowState();
  }
}
class BookNowState extends State<BookNow> {
   var selectedVenue;
  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();
  bool _autovalidate = false;
  String name, people,nam,con,even;
  String _dateText='';
  String _timeText='';

  DateTime _date=new DateTime.now();
  TimeOfDay _time=new TimeOfDay.now();

  Future<Null> _selectDate(BuildContext context) async{
    
    final DateTime picked=await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: new DateTime(2019),
      lastDate: new DateTime(2020),
      );
      if(picked!=null && picked!=_date){
        print('Date selected:${_date.toString()}');
        setState(() {
          _date=picked;
          _dateText="${picked.day}/${picked.month}/${picked.year}";
        });

      }

  }
    Future<Null> _selectTime(BuildContext context) async{
      final TimeOfDay picked=await showTimePicker(
      context: context,
      initialTime: _time,
      
      );
      if(picked!=null && picked!=_time){
        print('Date selected:${_time.toString()}');
        setState(() {
          _time=picked;
          _timeText="${picked.hour}:${picked.minute}";
        });
    }
    //else return null;
    }
  @override
  void initState(){
    super.initState();
    _dateText="${_date.day}/${_date.month}/${_date.year}";
    _timeText="${_time.hour}:${_time.minute}";
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Book Now"),
        backgroundColor: Colors.pink.shade400,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            new Form(
              key: _formKeyValue,
               autovalidate: _autovalidate,
              child: formUI(),

            ),//form ends here
          ],
        ),
      ),


    );
  }
  Widget formUI(){
    return new Column(
                children: <Widget>[
                  new Padding(padding: new EdgeInsets.all(10.5)), 
                   SizedBox(height: 40.0),
             new StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance.collection("Choose Destination").snapshots(),
                  builder: (context, 
                  snapshot) {
                    if (!snapshot.hasData)
                      return const Text("Loading.....");
                    else {
                      List<DropdownMenuItem> venueList = [];
                      for (int i = 0; i < snapshot.data.documents.length; i++) {
                        DocumentSnapshot snap = snapshot.data.documents[i];
                        venueList.add(
                          DropdownMenuItem(
                            child: Text(
                              snap.documentID,
                              style: TextStyle(color: Colors.pink.shade400),
                            ),
                            value: "${snap.documentID}",
                          ),
                        );
                      }
                      return Container(
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Select a Venue"),
                          SizedBox(width: 50.0,height:20.0),
                          DropdownButton(
                            items: venueList,
                            onChanged: (venueName) {
                              final snackBar = SnackBar(
                                content: Text(
                                  'Selected Venue is $venueName',
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                              Scaffold.of(context).showSnackBar(snackBar);
                              setState(() {
                                selectedVenue = venueName;
                              });
                            },
                            value: selectedVenue,
                            isExpanded: false,
                            hint: new Text(
                              "Choose Venue",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                        ),
                        ),
                      );
                    }
                  }), 
                 new Padding(
                   
                   padding: const EdgeInsets.all(10.5), //add paddin
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Expanded(child:Text("Date", style:new TextStyle(fontSize:22.0, color:Colors.black))),
                         new RaisedButton(
                             onPressed:()=>_selectDate(context),
                             color: Colors.pink.shade400,
                              child: new Text(_dateText,
                                 style: new TextStyle(color: Colors.white,
                                 fontSize: 16.9)
                                 ),
                                 ),                       
                      ],
                    ),
                  ),
                  new Padding(
                  padding: const EdgeInsets.all(10.5), //add padding
                    child: new Row(
                      children: <Widget>[
                    new Expanded(child:Text("Time", style:new TextStyle(fontSize:22.0, color:Colors.black))),
                          new RaisedButton(
                            onPressed:()=>_selectTime(context),
                            color: Colors.pink.shade400,
                            child:Text(_timeText, style: new TextStyle(color: Colors.white,
                         fontSize: 16.9
                          ))),
                          //  margin: const EdgeInsets.only(left: 38.0),
                          //  child:new RaisedButton(
                          //    onPressed:(){
                          //      _selectTime(context);
                          //     },
                          //      color: Colors.pink.shade400,
                          //      child: new Text('Select Time',
                          //        style: new TextStyle(color: Colors.white,
                          //        fontSize: 16.9)
                          //        ),
                          //        ),
                                                
                      ],
                    ),
                  ),
                  
                  new Padding(padding: new EdgeInsets.all(10.0)), 
                    new TextFormField(
                      decoration: new InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        filled:true,
                          labelText: 'No of People',
                      ),
                       validator: validateName,
                        onSaved: (val) {
                         people = val;
                        },
                    ),
                    new Padding(padding: new EdgeInsets.all(10.0)), 
                     new TextFormField(
                      decoration: new InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        filled:true,
                          labelText: 'Name',
                      ),
                       validator: validateName,
                        onSaved: (val) {
                         nam = val;
                        },
                    ),
                    new Padding(padding: new EdgeInsets.all(10.0)), 
                     new TextFormField(
                      decoration: new InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        filled:true,
                          labelText: 'Contact',
                      ),
                       validator: validateName,
                        onSaved: (val) {
                         con = val;
                        },
                    ),
                    new Padding(padding: new EdgeInsets.all(10.0)), 
                     new TextFormField(
                      decoration: new InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        filled:true,
                          labelText: 'Event',
                      ),
                       validator: validateName,
                        onSaved: (val) {
                         even = val;
                        },
                    ),
                    // new Padding(padding: new EdgeInsets.all(10.5)), 
                    //  new TextFormField(
                    //   decoration: const InputDecoration(
                    //   border:OutlineInputBorder(),
                    //   filled: true,
                    //   contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    // labelText: 'Outdoor/Indoor',
             
            // ),
            //      keyboardType: TextInputType.text,
                  
            //         ),

                  new Padding(padding: new EdgeInsets.all(10.5)), //add padding
                  new Center(
                    child: new Column(
                      children: <Widget>[
                         // Login button
                         new Container(
                           margin: const EdgeInsets.only(left: 38.0),
                           child: new RaisedButton(
                             onPressed:_sendToServer,
                               color: Colors.pink.shade400,
                               child: new Text("Submit",
                                 style: new TextStyle(color: Colors.white,
                                 fontSize: 16.9))),
                         ),
                         
                      ],
                    ),
                  )
                ],
              );
  }

  void validator() => validator;
  _sendToServer() {

    if (_formKeyValue.currentState.validate()) { //what is this?

      _formKeyValue.currentState.save();

      print('validate bhayo');
      print(selectedVenue);
      DatabaseReference ref = FirebaseDatabase.instance.reference().child('node-name');
          ref.once().then((DataSnapshot snap) async {
            print('data ayooo'); //yo print huncha ki hunna herum
            var keys = snap.value.keys;
            var dataa = snap.value;
            var error = false;
            for (var key in keys) {
              String time = dataa[key]['Time'].toString();
              String venue = dataa[key]['Destination'].toString();
              String date = dataa[key]['Date'].toString();
              if(time==_timeText && venue==selectedVenue &&date==_dateText){
                //AN ERROR MESSAGE
                error = true;
                break;
              }else{
                error = false;
              }
            }

            if(error){
                print("Yeta dialog ma error lekha");
                return showDialog<void>(
                 context: context,
                 builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Cannot Book'),
                    content: const Text('This venue is no already booked at this time!'),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Ok'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }else{
              DatabaseReference ref = FirebaseDatabase.instance.reference();
                var data = {
                  "Destination": selectedVenue,
                  "Time":_timeText,
                  "Date":_dateText,
                  "People": people,
                  "Name": nam,
                  "Contact": con,
                  "Event":even,
                  
                };
                ref.child('node-name').push().set(data).then((v) {
                  _formKeyValue.currentState.reset();
                });
                
                return showDialog<void>(
                 context: context,
                 builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Booked'),
                    content: const Text('You have booked the venue!'),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Ok'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }
          });

    } else {
      setState(() {
        _autovalidate = true;
      });
    }
    
  }

  String validateName(String val) {
    return val.length == 0 ? "Enter no of people" : null;
  }

  Duration parseDuration(String s) {
  int hours = 0;
  int minutes = 0;
  int micros;
  List<String> parts = s.split(':');
  if (parts.length > 2) {
    hours = int.parse(parts[parts.length - 3]);
  }
  if (parts.length > 1) {
    minutes = int.parse(parts[parts.length - 2]);
  }
  micros = (double.parse(parts[parts.length - 1]) * 1000000).round();
  return Duration(hours: hours, minutes: minutes, microseconds: micros);
}
}
