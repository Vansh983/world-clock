import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    String bgimg = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
//    Color bgcolor = data['isDayTime'] ? Colors.blue : Colors.black;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgimg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'World Clock',
                        style: TextStyle(
                          fontFamily: 'Josefin',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      FlatButton.icon(
                          onPressed: () async {
                            dynamic result = await Navigator.pushNamed(context, '/location');
                            setState(() {
                              data = {
                                'time': result['time'],
                                'location': result['location'],
                                'isDayTime': result['isDayTime'],
                                'flag': result['flag'],
                              };
                            });
                          },

                          icon: Icon(
                              Icons.add,
                            color: Colors.black,
                            size: 40,
                          ),
                          label: Text(
                              '',

                          ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,20,0),
                    child: Divider(
                      height: 30,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                   // mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 30,
                          letterSpacing: 2,
                          color: Colors.black,
                          fontWeight: FontWeight.w100,
                          fontFamily: 'Raleway',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 70,
                      color: Colors.black,

                      fontFamily: 'Josefin',
                    ),

                  ),
//                  SizedBox(height: 20,),
//                  Text(
//                    data['day'],
//                    style: TextStyle(
//                      fontSize: 30,
//                      letterSpacing: 2,
//                      color: Colors.black,
////                          fontWeight: FontWeight.,
//                      fontFamily: 'Josefin',
//                    ),
//                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
