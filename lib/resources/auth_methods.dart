import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice/models/user.dart' as model;
import 'package:practice/resources/profile_controller.dart';
import '../screens/home/shop.dart';
import '../utils/utils.dart';

class AuthMethods {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void signOut(context) {
    try {
      firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      Utils().showSnackBar(context, e.toString());
    }
  }

  void signupUser(
      context, String first, String last, String email, String password) async {
    try {
      final cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      model.User user = model.User(
          email: email, first: first, uid: cred.user!.uid, last: last);
      await firestore
          .collection('users')
          .doc(cred.user!.uid)
          .set(user.toJSON());
      Navigator.pushAndRemoveUntil(
          context,
          (MaterialPageRoute(builder: (context) => const Shopping())),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Utils().showSnackBar(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Utils().showSnackBar(
            context, 'The account already exists for that email.');
      }
    } catch (e) {
      Utils().showSnackBar(context, e.toString());
    }
  }

  void signinUser(context, String email, String password) async {
    try {
      // ignore: unused_local_variable
      var userCredentials = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      ProfileController().updateUser(FirebaseAuth.instance.currentUser!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Utils().showSnackBar(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Utils().showSnackBar(context, 'Wrong password provided for that user.');
      }
    }
  }
}
