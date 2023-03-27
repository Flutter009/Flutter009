import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Vx.gray600,
        appBar: AppBar(
          backgroundColor: Vx.black,
          title: Text(
            'Your Favorites',
            style: GoogleFonts.akshar(fontSize: 18, color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: FirebaseAnimatedList(
                  query: FirebaseDatabase.instance
                      .ref(FirebaseAuth.instance.currentUser!.uid)
                      .child('favourites'),
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
