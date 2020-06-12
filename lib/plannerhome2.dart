import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:yozana/plannershow.dart';
import'dart:async';

import 'notification_page.dart';
class Book extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BookState();
  }
}
class BookState extends State<Book> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _autovalidate = false;
  String name, phone, address,people;
 String _dateText='';
  String _timeText='';
  bool photographer = false;
  bool extradecoration = false;
   
 Widget checkbox(String title, bool boolValue) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title),
        Checkbox(
          value: boolValue,
          onChanged: (bool value) {
            setState(() {
              switch (title) {
                case "Photographer":
                  photographer = value;
                  break;
              }
              switch (title) {
                case "Extra Decoration":
                  extradecoration = value;
                  break;
              }
            });
          },
        )
      ],
    );
  }
  DateTime _date=new DateTime.now();
  TimeOfDay _time=TimeOfDay.now();
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
        });

      }
  }
    Future<Null> _selectTime(BuildContext context) async{
      final TimeOfDay picked=await showTimePicker(
      context: context,
      initialTime: _time,
      
      );
      if(picked!=null && picked!=_time){
        print('Date selected:${_date.toString()}');
        setState(() {
          _time=picked;
        });
    }
    }
    @override
  void initState(){
    super.initState();
    _dateText="${_date.day}/${_date.month}/${_date.year}";
    _timeText="${_time.hour}/${_time.minute}";
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Home"),
        backgroundColor: Colors.pink.shade600,
        actions:<Widget>[
          new IconButton(
            icon:new Icon(Icons.notifications),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>NotificationPage()));
            }
          ),
        ]
          ), 
      
        
        drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            
//            header
            new UserAccountsDrawerHeader(
              accountName: Text('ABCD'),
              accountEmail: Text('hotelhimalaya.ss@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white,),
                ),
              ),
              decoration: new BoxDecoration(
                  color: Colors.pink.shade600
              ),
            ),

//            body

            InkWell(
              onTap: ()=>Navigator.pushNamed(context, "/PlannerBook"),
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home),
              ),
            ),

            InkWell(
              onTap: ()=>Navigator.pushNamed(context, "/ProfilePage"),
              child: ListTile(
                title: Text('My account'),
                leading: Icon(Icons.person),
              ),
            ),
            Divider(),

            InkWell(
              onTap: ()=>Navigator.pushNamed(context, "/loginOne"),
              child: ListTile(
                title: Text('LogOut'),
                leading: Icon(Icons.arrow_back_ios),
              ),
            ),
          ],
        ),
      ),
body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          
          children: <Widget>[
             new Image.asset(
              'assets/lights.jpg',
               //width: 400.0,
              height: 150.0,
            fit: BoxFit.cover,
            ),
             new Image.asset(
              'assets/booknow.jpg',
               //width: 400.0,
            //height: 140.0,
              fit: BoxFit.cover,
            ),
            new Form(
              key: _key,
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
                         name = val;
                        },
                    ),
                     new Padding(padding: new EdgeInsets.all(10.0)), 
                    new TextFormField(
                      decoration: new InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        filled:true,
                          labelText: 'Phone',
                      ),
                       validator: validatePhone,
                        onSaved: (val) {
                         phone = val;
                        },
                    ),
                     new Padding(padding: new EdgeInsets.all(10.0)), 
                    new TextFormField(
                      decoration: new InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        filled:true,
                          labelText: 'Address',
                      ),
                       validator: validateAddress,
                        onSaved: (val) {
                         address = val;
                        },
                    ),
                     new Padding(padding: new EdgeInsets.all(10.0)), 
                    new TextFormField(
                      decoration: new InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        filled:true,
                          labelText: 'No of People',
                      ),
                       validator: validatePeople,
                        onSaved: (val) {
                         people = val;
                        },
                    ),
                  new Padding(padding: new EdgeInsets.all(10.5), 
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
                      ],
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(10.5)), 
                  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  checkbox("Extra Decoration",extradecoration),
                ],
              ),
              
            ],
          ),
        ),
        new Padding(padding: new EdgeInsets.all(10.5)), 
                  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  checkbox("Photographer",photographer),
                ],
              ),
            ],
          ),
        ),
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
                               child: new Text("Save",
                                 style: new TextStyle(color: Colors.white,
                                 fontSize: 16.9))),
                         ),
                         
                      ],
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(10.5)), //add padding
                  new Center(
                    child: new Column(
                      children: <Widget>[
                         // Login button
                         new Container(
                           margin: const EdgeInsets.only(left: 38.0),
                           child: new RaisedButton(
                             onPressed:(){
                                Navigator.push(context,
                MaterialPageRoute(builder: (context) => new ShowDataPage()));
                              
                    },
                               color: Colors.pink.shade400,
                               child: new Text("Show Data",
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
    if (_key.currentState.validate()) {
      _key.currentState.save();
      DatabaseReference ref = FirebaseDatabase.instance.reference();
      var data = {
        "name": name,
        "phone": phone,
        "address": address,
        "people":people,
      };
      ref.child('planner-name').push().set(data).then((v) {
        _key.currentState.reset();
      });
    } else {
      setState(() {
        _autovalidate = true;
      });
    }
  }

  String validateName(String val) {
    return val.length == 0 ? "Enter Name First" : null;
  }

  String validatePhone(String val) {
    return val.length == 0 ? "Enter Phone number" : null;
  }
   String validateAddress(String val) {
    return val.length == 0 ? "Enter Address" : null;
  }
    String validatePeople(String val) {
     return val.length == 0 ? "Enter no. of people" : null;
  }
  String validateDate(String val) {
     return val.length == 0 ? "Enter Date" : null;
  }
  String validateTime(String val) {
     return val.length == 0 ? "Enter Time" : null;
  }
  String validateDecoration(String val) {
     return val.length == 0 ? "Extra Decoration" : null;
  }
  String validatePhotographer(String val) {
     return val.length == 0 ? "Photographer" : null;
  }
 }
 







  
//       body: new Container(
//         alignment: Alignment.topCenter,
        // child: new ListView(
          // children: <Widget>[
          //    new Image.asset(
          //     'assets/lights.jpg',
          //      //width: 400.0,
          //     height: 150.0,
          //   fit: BoxFit.cover,
          //   ),
          //    new Image.asset(
          //     'assets/booknow.jpg',
          //      //width: 400.0,
          //   //height: 140.0,
          //     fit: BoxFit.cover,
          //   ),
//               Expanded(
//               child: new Form(
//                 key: _key,
//                 autovalidate:_autovalidate,
//                 //children: <Widget>[
//                   child: Padding(padding: new EdgeInsets.all(10.5), 
//                    child:Column( 
//                      children:<Widget>[new TextFormField(
//                 validator: validateName,
//                 onSaved: (val) {
//                   name = val;
//                 },
//                       decoration: const InputDecoration(
//                       border:OutlineInputBorder(),
//                       filled: true,
//                       contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                     labelText: 'Name',
                    
             
//             ),
//                  keyboardType: TextInputType.text,
                  
//                     ),
                   
//                     new Padding(padding: new EdgeInsets.all(10.5)), 
//                      new TextFormField(
//                        validator: validateName,
//                 onSaved: (val) {
//                   name = val;
//                 },
//                       decoration: const InputDecoration(
//                       border:OutlineInputBorder(),
//                       filled: true,
//                       contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                     labelText: 'Phone Number',
                   
//             ),
            
//                  keyboardType: TextInputType.number,
                  
//                     ),
//                     new Padding(padding: new EdgeInsets.all(10.5)), 
//                      new TextFormField(
//                        validator: validatePhone,
//                 onSaved: (val) {
//                   name = val;
//                 },
//                       decoration: const InputDecoration(
//                       border:OutlineInputBorder(),
//                       filled: true,
//                       contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                     labelText: 'Address',
                    
             
//             ),
//                  keyboardType: TextInputType.text,
                  
//                     ),
//                        new Padding(padding: new EdgeInsets.all(10.5)), //add padding
//                   new Center(
//                     child: new Column(
//                       children: <Widget>[
//                          new Container(
//                            margin: const EdgeInsets.only(left: 38.0),
//                            child:new RaisedButton(
//                              onPressed:(){
//                                _selectDate(context);
//                               },
//                                color: Colors.pink.shade400,
//                                child: new Text('Select Date',
//                                  style: new TextStyle(color: Colors.white,
//                                  fontSize: 16.9)
//                                  ),
//                                  ),
//                          ),
                         
//                       ],
//                     ),
//                   ),
//                   new Padding(padding: new EdgeInsets.all(10.5)), //add padding
//                   new Center(
//                     child: new Column(
//                       children: <Widget>[
//                          new Container(
//                            margin: const EdgeInsets.only(left: 38.0),
//                            child:new RaisedButton(
//                              onPressed:(){
//                                _selectTime(context);
//                               },
//                                color: Colors.pink.shade400,
//                                child: new Text('Select Time',
//                                  style: new TextStyle(color: Colors.white,
//                                  fontSize: 16.9)
//                                  ),
//                                  ),
//                          ),
                         
//                       ],
//                     ),
//                   ),
                  
//                   new Padding(padding: new EdgeInsets.all(10.0)), 
//                     new TextFormField(
//                       validator: validatePeople,
//                 onSaved: (val) {
//                   name = val;
//                 },
//                       decoration: new InputDecoration(
                        
//                         border: OutlineInputBorder(),
//                         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                         filled:true,
//                           labelText: 'No of People',
                          

//                       ),
//                     ),
                    
//                     new Padding(padding: new EdgeInsets.all(10.5)), 
//                   Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   checkbox("Photographer", photographer),
//                 ],
//               ),
//             ],
//           ),
//         ),
        // new Padding(padding: new EdgeInsets.all(10.5)), 
        //           Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: <Widget>[
        //           checkbox("Extra Decoration",extradecoration),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
                //   new Padding(padding: new EdgeInsets.all(10.5)), 
                //   new Center(
                //     child: new Column(
                //       children: <Widget>[
                //          // Login button
                //          new Container(
                //            margin: const EdgeInsets.only(left: 38.0),
                //            child: new RaisedButton(
                //              onPressed:(){
                //                 Navigator.push(context,
                // MaterialPageRoute(builder: (context) => new ShowDataPage()));
                              
                //     },
                              
                //                color: Colors.pink.shade400,
                //                child: new Text("Save",
                //                  style: new TextStyle(color: Colors.white,
                //                  fontSize: 16.9))),
                //          ),
                         
                //       ],
                //     ),
                //   )
//              ],
//               ),

//             ),

//               )
//                ),]
//                ),
              
        
      
            

//       )
//     );
//   }
//    void validator() => validator;
//    _sendToServer() {
//     if (_key.currentState.validate()) {
//       _key.currentState.save();
//       DatabaseReference ref = FirebaseDatabase.instance.reference();
//       var data = {
//         "name": name,
//         "phone": phone,
//         "address": address,
//         "people":people,
//       };
//       ref.child('planner-name').push().set(data).then((v) {
//         _key.currentState.reset();
//       });
//     } else {
//       setState(() {
//         _autovalidate = true;
//       });
//     }
//   }

//   String validateName(String val) {
//     return val.length == 0 ? "Enter Name First" : null;
//   }

//   String validatePhone(String val) {
//     return val.length == 0 ? "Enter Phone number" : null;
//   }
//    String validateAddress(String val) {
//     return val.length == 0 ? "Enter Address" : null;
//   }
//     String validatePeople(String val) {
//      return val.length == 0 ? "Enter no. of people" : null;
//   }
//  }
 







  