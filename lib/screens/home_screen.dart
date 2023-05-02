import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        TextButton.icon(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
          icon: Icon(Icons.logout),
          label: Text('signOut'),
        )
      ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(12),
            child: const Image(
              image: AssetImage('assets/images/construction.png'),
            ),
            alignment: Alignment.center,
          ),
          Text(
            'This page under construction',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
