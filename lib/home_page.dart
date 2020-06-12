import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yozana/Views/home_view.dart';
import'package:yozana/home1.dart';
import 'package:yozana/map.dart';
//import 'package:yozana/plannerhome2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  static String tag = 'home-page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
  int _selectedPage=0;
  Widget callPage(int selectedPage){
    switch(selectedPage){
      case 0:return HomeOne();
      case 1:return Maps();
      case 2:return HomeView();
      break;
      default:return HomeOne();

    }

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
                  appBar: new AppBar(

                                      elevation: 0.0,
                                      title:new Text('Home',style: TextStyle(color: Colors.white)),
                                      centerTitle: true,
                                      backgroundColor: Colors.pink.shade600,
                                      actions:<Widget>[
          new IconButton(
            icon:new Icon(Icons.search),
            onPressed: (){
              showSearch(context: context,
              delegate: DataSearch(),
              );
            }
          ),
                                      ],
          ),
          
     drawer: new Drawer(
       child: new ListView(
         children: <Widget>[
           new UserAccountsDrawerHeader(
             accountName: new Text('A'),
             accountEmail: new Text('abcd'),
             currentAccountPicture: new CircleAvatar(
               backgroundColor: Colors.pink.shade100,
               child: new Text("A"),
             ),
           ),
            new ListTile(
              title: new Text('Profile'),
              trailing:new Icon(Icons.person_pin,),
              onTap: ()=>Navigator.pushNamed(context, "/ProfilePage"),
           ),
           new ListTile(
              title: new Text('About'),
              trailing:new Icon(Icons.help,color: Colors.blue,),
              onTap: ()=>Navigator.pushNamed(context, "/AboutPage"),
           ),
           new ListTile(
              title: new Text('Log Out'),
              onTap: ()=>Navigator.pushNamed(context, "/loginOne"),
              
           ),
         ],
       ),
     ),        
     body:callPage(_selectedPage),

     bottomNavigationBar: new BottomNavigationBar(
       currentIndex:_selectedPage,
       onTap: (int index){
         setState((){
           _selectedPage=index;
         });
       },
       items:[
          new BottomNavigationBarItem(icon :new Icon(Icons.home),title:Text("Home"),),
          new BottomNavigationBarItem(icon: new Icon(Icons.map),title:Text("Map")),
          new BottomNavigationBarItem(icon: new Icon(Icons.notifications),title:Text("Reminder")),
        ] ,
     ),
     
    );
  
  }}
  class DataSearch extends SearchDelegate<String>{
      final suggestplace=[
      "Summit hotel",
      "Himalayan Hotel",
      "Lainchaur Banquet",
      "Kupondole Banquet",
      "Sajha Party Palace",
      "Kailash Banquet",
      "Karki Banquet",
      "Indreni Complex",
      "Yak Palace",
      "Ashok Party Palace",
      "Kumari Party Palace",
    ];
    final palaces=[
    ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear),onPressed: (){
        query="";
      },)
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
      icon:AnimatedIcons.menu_arrow,
      progress:transitionAnimation,
    ),
    onPressed: (){
      close(context, null);
    },);
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList=query.isEmpty
    ?palaces
    :suggestplace.where((p)=>p.startsWith(query)).toList();
   
    return ListView.builder(
      itemBuilder:(context,index)=>ListTile(
        onTap: (){
          showResults(context);
        },
      leading: Icon(Icons.place),
      title:RichText(text: TextSpan(
        text:suggestionList[index].substring(0,query.length),
        style:TextStyle(color:Colors.black,fontWeight: FontWeight.bold),
         children: [TextSpan(
           text:suggestionList[index].substring(query.length),
             style: TextStyle(color: Colors.grey),  
           ),
         ],
         ),
      ),
      ),
       itemCount: suggestionList.length,
    );
    
  }

  }

 