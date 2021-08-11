import 'package:flutter/material.dart';

class NotifyScreen extends StatelessWidget {
  const NotifyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text('Mensaje'),
      ),

      body: Center(child: Text('Mensaje', style: TextStyle(color: Colors.black26, fontWeight: FontWeight.bold),),
      )
    );
  }
}