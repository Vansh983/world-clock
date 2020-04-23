import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


  @override
  Widget build(BuildContext context) {
    print('run init2');
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Text('location'),
    );
  }
}
