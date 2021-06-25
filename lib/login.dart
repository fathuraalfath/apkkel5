import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:apkkel5/mainpage.dart';

String username = '';

class LoginPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      home: new MyHomePage(),
      routes: <String, WidgetBuilder>{
        "/mainpage": (BuildContext context) => new MainPage(
              username: username,
            )
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  String msg = '';

  Future<List> _proseslogin() async {
    final response = await http
        .post("http://127.0.0.1/login_flutter/proses_login.php", body: {
      "username": user.text,
      "password": pass.text,
    });
    var datamain = json.decode(response.body);

    if (datamain.length == 1) {
      Navigator.pushReplacementNamed(context, '/mainpage');
      setState(() {
        username = datamain[0]['username'];
      });
    } else {
      setState(() {
        msg = "Login Gagal";
      });
    }
    return datamain;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Login to your account",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Username",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 18.0),
                      ),
                      TextField(
                        controller: user,
                        decoration: InputDecoration(hintText: 'Username'),
                      ),
                      Text(
                        "Password",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 18.0),
                      ),
                      TextField(
                        controller: pass,
                        obscureText: true,
                        decoration: InputDecoration(hintText: 'Password'),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      RaisedButton(
                        child: Text("Login"),
                        onPressed: () {
                          _proseslogin();
                        },
                      ),
                      Text(
                        msg,
                        style: TextStyle(fontSize: 15.0, color: Colors.red),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?"),
                    Text(
                      " Sign up",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 100),
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/background.png"),
                        fit: BoxFit.fitHeight),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
