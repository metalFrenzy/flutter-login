import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class AuthProvider with ChangeNotifier {
  final _auth = FirebaseAuth.instance;

  void submit(
    String email,
    String password,
    String number,
    String name,
    String nationalId,
    BuildContext context,
    bool isLogin,
  ) async {
    UserCredential res;
    try {
      //login
      if (isLogin) {
        res = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        //signUp
      } else {
        res = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        /*this will create a collection called users, the collection
        will have documents by the userid each document will have name,email w keda*/
        await FirebaseFirestore.instance
            .collection('users')
            .doc(res.user!.uid)
            .set({
          'name': name,
          'nationalId': nationalId,
          'email': email,
          'number': number
        });
      }
      // error handling stuff
    } on PlatformException catch (error) {
      var message = 'Invalid email or password';
      if (error.message != null) {
        message = error.message!;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    } catch (error) {
      print(error);
    }
  }
}
