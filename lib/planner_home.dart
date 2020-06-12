import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yozana/plannerhome2.dart';

class PlannerPage extends StatefulWidget {
  PlannerPage({Key key,this.title}) : super(key:key);
  final String title;
  @override
  _PlannerPageState createState() => _PlannerPageState();
}

class _PlannerPageState extends State<PlannerPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Venues"),
        backgroundColor: Colors.pink.shade400,
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('Choose Destination').snapshots(),
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return const Text('Loading...');
          }
          else{
            return ListView.builder(
              itemCount:  snapshot.data.documents.length,
            itemBuilder: (context,index){
              DocumentSnapshot mypost=snapshot.data.documents[index];
              return Stack(
                children: <Widget>[
                  Column(children: <Widget>[
                  Container(
                    width:MediaQuery.of(context).size.width,
                    height: 350.0,
                    child: Padding(
                      padding: EdgeInsets.only(top: 8.0,bottom: 8.0),
                      child: Material(
                        color: Colors.white,
                        elevation: 14.0,
                        shadowColor: Colors.pink,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width:MediaQuery.of(context).size.width,
                                  height: 200.0,
                                  child: Image.network(
                                    '${mypost['image']}',
                                    fit :BoxFit.fill
                                  ),
                                  ),
                           
                                  SizedBox(height: 10.0),
                                  Text('${mypost['Hall name']}',
                                    style: TextStyle(fontSize:20.0,fontWeight: FontWeight.bold ),
                                    ),
                                    SizedBox(height: 10.0),
                                  Text('${mypost['Address']}',
                                    style: TextStyle(fontSize:16.0,fontWeight: FontWeight.bold,color: Colors.blueGrey ),
                                    ),
                              ],
                            )
                            ),
                            ),
                      ),
                      ),
                  ),
                  ]),
                  Container(
                    child: new GestureDetector(
                      onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Book()));

                      },
                    
                    child: Container(
                      alignment:Alignment.topRight ,
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height *.2,
                      left:MediaQuery.of(context).size.height *.2,
                    ),
                      width: MediaQuery.of(context).size.width ,
                      child: CircleAvatar(
                        backgroundColor: Colors.pink.shade400,
                        child: Icon(Icons.star,color:Colors.white,size: 20.0),
                      ),
                    ),
                    ),
                    )
                ],
               
              );
            });

          }
        }
      )
    );
  }
}
class Intoit extends StatelessWidget {

  final  user;

  Intoit(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(user.name),
        )
    );
  }
}
// class Images extends StatelessWidget {
//   final String imageloc;
//   final String imagecap;
//   Images({this.imageloc, this.imagecap});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(2.0),
//       child: InkWell(
//         onTap: () {
//           Navigator.pushNamed(context, "/Pin");
//         },
//         child: Container(
//           padding: const EdgeInsets.all(2.0),
//           width: 400.0,
//           child: ListTile(
//             title: Image.asset(
//               imageloc,
//               width: 380.0,
//               height: 280.0,
//             ),
//             subtitle: Container(
//               alignment: Alignment.topCenter,
//               child: Text(imagecap, style: new TextStyle(fontSize: 22.0),),
//             )
//           ),
//         ),
//       ),
//     );
//   }
// }
