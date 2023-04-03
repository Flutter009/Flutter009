// ignore_for_file: avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:practice/screens/user_home/profile_screen.dart';
import 'package:practice/screens/user_home/sort.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../screens/user_home/home.dart';
import '../screens/user_home/my_books.dart';

class Utils {
  String pic =
      "https://img.freepik.com/premium-vector/accoun-vector-icon-with-long-shadow-white-illustration-isolated-blue-round-background-graphic-web-design_549897-771.jpg";
  Widget getBook() {
    return Container(
      color: Vx.purple500,
      height: 30,
      width: 30,
      child: Lottie.asset('assets/images/book.json'),
    );
  }

  final List<Widget> pages = [
    const Home(),
    const Sort(),
    const MyBooks(),
    const ProfileScreen(),
  ];

  showSnackBar(BuildContext context, String content) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(content)));
  }

  int itemCount = 0;

  Widget getSizedBox(double? height) {
    return SizedBox(
      height: height,
    );
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  // final ref = FirebaseDatabase.instance.ref();
  // final uid = FirebaseAuth.instance.currentUser!.uid;
  Future<int> getLength() async {
    int length = await FirebaseDatabase.instance
        .ref()
        .child(FirebaseAuth.instance.currentUser!.uid)
        .child('cart')
        .get()
        .then((value) {
      return value.children.length;
    });
    return length;
  }

  Future<int> getBooks() async {
    int data = await FirebaseFirestore.instance
        .collection('books')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      return value.docs.length;
    });
    return data;
  }

  Future<int> getFavLength() async {
    int length = await FirebaseDatabase.instance
        .ref()
        .child(FirebaseAuth.instance.currentUser!.uid)
        .child('favourites')
        .get()
        .then((value) {
      return value.children.length;
    });
    return length;
  }

  pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);
    if (file != null) {
      return await file.readAsBytes();
    }
    print('No Image Selected');
  }

  pickfile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null) {
      final file = result.files.first;
      return file;
    } else {
      print('No File selected');
    }
  }
}
