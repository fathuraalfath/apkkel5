import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  MainPage({this.username});
  final String username;
  int _currentIndex = 0;

  final tabs = [
    Container(
        child: ListView(
      children: <Widget>[
        new Container(
          child: new Row(
            children: <Widget>[
              new Text(" "),
            ],
          ),
        ),
        new Container(
          child: new Row(
            children: <Widget>[
              new Text(
                "FEATURED",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ],
          ),
        ),
        new Container(
          child: new Row(
            children: <Widget>[
              new Text(" "),
            ],
          ),
        ),
        new Container(
          child: new Row(
            children: <Widget>[
              new Image.asset(
                'assets/loki.jpg',
                height: 200,
              ),
              new Text("Loki (2021)",
                    style: TextStyle(
                    fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        new Container(
          child: new Row(
            children: <Widget>[
              new Image.asset(
                'assets/rick.jpg',
                height: 200,
              ),
              new Text("Rick And Marty(2013)",
                    style: TextStyle(
                    fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        new Container(
          child: new Row(
            children: <Widget>[
              new Image.asset(
                'assets/record.jpg',
                height: 180,
              ),
              new Text("Record Of Ragnarok(2021)",
                    style: TextStyle(
                    fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        new Container(
          child: new Row(
            children: <Widget>[
              new Image.asset(
                'assets/luca.jpg',
                height: 200,
              ),
              new Text("Luca(2021)",
                    style: TextStyle(
                    fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        new Container(
          child: new Row(
            children: <Widget>[
              new Image.asset(
                'assets/rurouni.jpg',
                height: 200,
              ),
              new Text("Rurouni Kenshin: The Final(2021)",
                    style: TextStyle(
                    fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        new Container(
          child: new Row(
            children: <Widget>[
              new Image.asset(
                'assets/quiet.jpg',
                height: 200,
              ),
              new Text("A Quiet Place II(2021)",
                    style: TextStyle(
                    fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        new Container(
          child: new Column(
            children: <Widget>[
              new Text(
                "Nedflix",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  backgroundColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        
        new Container(
          child: new Column(
            children: <Widget>[
              new Text(
                  "Nedflix adalah salah satu penyedia layanan streaming film dan serial tv gratis, kami mengambil serial-serial tv atau film terbaru dari penyedia layanan seperti Netflix, Disney+, HBO, Apple TV+, Amazon Prime Video atau berbagai layanan streaming berbayar lainnya dan dihadirkan disitus IDLIX, Rebahin secara gratis, perlu diketahui kami tidak menyediakan film-film atau serial tv dari negara Indonesia.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
        ),
      ],
    ))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Nedflix",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.grey[600],
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              title: Text('Categories'),
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.circle),
              title: Text('Coming Soon'),
              backgroundColor: Colors.white),
        ],
      ),
    );
  }
}
