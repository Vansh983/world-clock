import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    print(data);

    String bgimg = data['isDayTime'] ? 'morning.jpg' : 'night.jpeg';
    Color bgcolor = data['isDayTime'] ? Colors.blue : Colors.black;

    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgimg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/location');
                      },
                      icon: Icon(
                          Icons.edit_location,
                        color: Colors.grey[400],
                      ),
                      label: Text(
                          'Edit Location',
                           style: TextStyle(
                        color: Colors.grey[400],

                      ),
                      ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 30,
                          letterSpacing: 2,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 70,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
