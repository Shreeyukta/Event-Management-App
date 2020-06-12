import 'package:flutter/material.dart';
import 'package:yozana/planner_home.dart';
import 'login_page.dart';
import 'home_page.dart';
import'./splash/splash_screen.dart';
//import 'create_account.dart';
import'home1.dart';
import'event_page.dart';
import'notification_page.dart';
import'book_now.dart';
import'about_page.dart';
import'place_page.dart';
import'profile_page.dart';
import'./Views/home_view.dart';
import'pin.dart';
import'plannerhome2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
    SplashScreen.tag:(context)=>SplashScreen(),
   // CreateAccount.tag:(context)=>CreateAccount(),
   // "/CreateOne":(BuildContext context)=>CreateAccount(),
    "/loginOne":(BuildContext context)=>LoginPage(),
    "/homeOne":(BuildContext context)=>HomePage(),
    "/homeTwo":(BuildContext context)=>HomeOne(),
    "/EventOne":(BuildContext context)=>EventPage(),
    "/NotifyOne":(BuildContext context)=>NotificationPage(),
    "/BookOne":(BuildContext context)=>BookNow(),
    "/AboutPage":(BuildContext context)=>AboutPage(),
    "/PlacePage":(BuildContext context)=>PlacePage(),
    "/ProfilePage":(BuildContext context)=>ProfilePage(),
    "/HomeView":(BuildContext context)=>HomeView(),
    "/Pin":(BuildContext context)=>Pin(),
     "/PlannerBook":(BuildContext context)=>Book(),
      "/PlannerPage":(BuildContext context)=>PlannerPage(),
     
     

  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yozana',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'Nunito',
      ),
      home: SplashScreen(),
      routes: routes,
    );
  }
}


