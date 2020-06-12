import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yozana/auth.dart';
import 'package:yozana/home_page.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
             new Padding(padding: new EdgeInsets.all(10.0)), 
             new Padding(padding: new EdgeInsets.only(left: 24.0,right: 34.0)),
            
            TextFormField(
              validator: (input) {
                if(input.isEmpty){
                  return 'Provide an email';
                }
                else return null;
              },
              decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                         border:OutlineInputBorder(),
                         icon: Icon(Icons.email),
                          hintText: 'Email Address',
                          labelText: 'Email*',
              ),
              onSaved: (input) => _email = input,
            ),
            new Padding(padding: new EdgeInsets.all(10.0)),
            TextFormField(
              validator: (input) {
                
                if(input.length < 6){
                  return 'Longer password please';
                }
                else return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        filled:true,
                          hintText: 'Password',
                          labelText: 'Password*',
                          icon: new Icon(Icons.lock),
              ),
              onSaved: (input) => _password = input,
              obscureText: true,
            ),
            RaisedButton(
              onPressed: signUp,
              child: Text('Sign up'),
            ),
          new Center(
                    child: new Column(
                      children: <Widget>[
                         // Login
                         new Container(
                           child: new RaisedButton(
                             onPressed:() {
                              signInWithGoogle().whenComplete(() {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return HomePage();
                                  },
                                  ),
                                  );
                                });
                                },
                               color: Colors.red,
                               child: new Text("Login with Google",
                                 style: new TextStyle(color: Colors.white,
                                 fontSize: 16.9))),
                         ),
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }

  void signUp() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      }catch(e){
        print(e.message);
      }
    }
  }
}