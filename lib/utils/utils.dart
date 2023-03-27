// ignore_for_file: avoid_print

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:practice/screens/user_home/profile_screen.dart';
import 'package:practice/screens/user_home/sort.dart';
import 'package:velocity_x/velocity_x.dart';

import '../screens/user_home/home.dart';
import '../screens/user_home/my_books.dart';

class Utils {
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
  // static List<Book> genre = [
  //   Book(
  //       user: ,
  //       uid: ,
  //       id: ,
  //       title: 'Fire',
  //       author: 'Steven Forrest',
  //       genre: 'Fiction',
  //       image: 'https://m.media-amazon.com/images/I/71OdB6vwIlL.jpg',
  //       preview:
  //           'A 19-year-old girl discovers she is the descendant of the Byzantine Emperor Justinian, and she learns that the emperor might have unleashed the plague on mankind and cursed his bloodline.',
  //       language: 'English',
  //       price: 199),
  //   Book(
  //       title: 'Ice',
  //       author: 'Steven Forrest',
  //       genre: 'Fiction',
  //       image:
  //           'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/81avSAFfgNL.jpg',
  //       preview:
  //           'A 19-year-old girl discovers she is the descendant of the Byzantine Emperor Justinian, and she learns that the emperor might have unleashed the plague on mankind and cursed his bloodline.',
  //       language: 'Hindi',
  //       price: 249),
  //   Book(
  //       title: 'Water',
  //       author: 'Steven Forrest',
  //       genre: 'Fiction',
  //       image: 'https://m.media-amazon.com/images/I/71OdB6vwIlL.jpg',
  //       language: 'English',
  //       preview:
  //           'A 19-year-old girl discovers she is the descendant of the Byzantine Emperor Justinian, and she learns that the emperor might have unleashed the plague on mankind and cursed his bloodline.',
  //       price: 599),
  //   Book(
  //       title: 'Land',
  //       author: 'Steven Forrest',
  //       genre: 'Fiction',
  //       image: 'https://m.media-amazon.com/images/I/51eQXckge-L.jpg',
  //       preview:
  //           'A 19-year-old girl discovers she is the descendant of the Byzantine Emperor Justinian, and she learns that the emperor might have unleashed the plague on mankind and cursed his bloodline.',
  //       language: 'Russian',
  //       price: 799),
  //   Book(
  //       title: 'Sea',
  //       author: 'Aquaman',
  //       genre: 'Fiction',
  //       image:
  //           'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/81avSAFfgNL.jpg',
  //       preview: 'Read it',
  //       language: 'Italian',
  //       price: 1099),
  //   Book(
  //       title: 'Fire',
  //       author: 'Some Dude',
  //       language: 'Hindi',
  //       genre: 'Thriller',
  //       image:
  //           'https://5.imimg.com/data5/SELLER/Default/2021/2/SA/IQ/HS/49559104/img-20210211-121925-1000x1000.jpg',
  //       preview: 'Read it',
  //       price: 249),
  //   Book(
  //       title: 'Space',
  //       author: 'Not another Dude',
  //       genre: 'Mystery',
  //       image: 'https://m.media-amazon.com/images/I/51lmjHXbUbL.jpg',
  //       preview: 'Read it',
  //       language: 'English',
  //       price: 1299),

  //   // {
  //   //   'image': 'https://m.media-amazon.com/images/I/71OdB6vwIlL.jpg',
  //   //   'title': 'Fiction'
  //   // },
  //   // {
  //   //   'image': 'https://m.media-amazon.com/images/I/51lmjHXbUbL.jpg',
  //   //   'title': 'Mystery'
  //   // },
  //   // {
  //   //   'image':
  //   //       'https://5.imimg.com/data5/SELLER/Default/2021/2/SA/IQ/HS/49559104/img-20210211-121925-1000x1000.jpg',
  //   //   'title': 'Story'
  //   // },
  //   // {
  //   //   'image':
  //   //       'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/81avSAFfgNL.jpg',
  //   //   'title': 'Society'
  //   // },
  //   // {
  //   //   'image': 'https://m.media-amazon.com/images/I/51eQXckge-L.jpg',
  //   //   'title': 'Technology'
  //   // },
  // ];

  static List best = [
    {
      'image': 'https://m.media-amazon.com/images/I/71OdB6vwIlL.jpg',
      'title': 'Fire'
    },
    {
      'image': 'https://m.media-amazon.com/images/I/51seH-SzjuL.jpg',
      'title': 'Ice'
    },
    {
      'image': 'https://m.media-amazon.com/images/I/51seH-SzjuL.jpg',
      'title': 'Water'
    },
    {
      'image': 'https://m.media-amazon.com/images/I/51seH-SzjuL.jpg',
      'title': 'Land'
    },
    {
      'image': 'https://m.media-amazon.com/images/I/51seH-SzjuL.jpg',
      'title': 'Sea'
    },
  ];

  static List authors = [
    {
      'image': 'https://m.media-amazon.com/images/I/51seH-SzjuL.jpg',
      'title': 'Prem Chand'
    },
    {
      'image': 'https://m.media-amazon.com/images/I/51seH-SzjuL.jpg',
      'title': 'Arthur Doyle'
    },
    {
      'image': 'https://m.media-amazon.com/images/I/51seH-SzjuL.jpg',
      'title': 'Leo Tolstoy'
    },
    {
      'image': 'https://m.media-amazon.com/images/I/51seH-SzjuL.jpg',
      'title': 'Roy'
    },
    {
      'image': 'https://m.media-amazon.com/images/I/51seH-SzjuL.jpg',
      'title': 'Walter'
    },
  ];
  static List language = [
    {
      'image': 'https://m.media-amazon.com/images/I/51ivn8CiNvL.jpg',
      'title': 'English'
    },
    {
      'image':
          'https://idara.com/wp-content/uploads/2020/07/Tibbe_Nabavi_Hindi-600x930.jpg',
      'title': 'Hindi'
    },
    {
      'image': 'https://images.frenchly.us/2017/07/Les-Miserable.jpg',
      'title': 'French'
    },
    {
      'image':
          'https://fivebooks.com/app/uploads/2011/11/188364254X.01.LZ_.jpg',
      'title': 'Italian'
    },
    {
      'image': 'https://m.media-amazon.com/images/I/81efT10BJAL.jpg',
      'title': 'Spanish'
    },
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
