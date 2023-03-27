import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  // var items;
  // var stream;
  // void activateListeners() {
  //   stream = FirebaseDatabase.instance
  //       .ref().child(FirebaseAuth.instance.currentUser!.uid)
  //       .onValue
  //       .listen((event) {
  //     items = Map<String, dynamic>.from(event.snapshot.value);
  //     final book = Book.fromJson(items);
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // activateListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade800,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          title: Text(
            'Cart',
            style: GoogleFonts.akshar(fontSize: 18, color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: FirebaseAnimatedList(
                  query: FirebaseDatabase.instance
                      .ref(FirebaseAuth.instance.currentUser!.uid)
                      .child('cart'),
                  itemBuilder: (context, snapshot, animation, index) {
                    return VStack([
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          VxBox(
                                  child: Image.network(
                                      snapshot.child('image').value.toString()))
                              .make(),
                          Container(
                            width: double.infinity,
                            color: Vx.gray600.withOpacity(0.7),
                            child: snapshot
                                .child('title')
                                .value
                                .toString()
                                .richText
                                .white
                                .make()
                                .p12(),
                          )
                        ],
                      )
                    ]).p32();
                  }),
            ),
          ],
        ));
  }
}
