import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../home/buy_book.dart';
import '../../resources/profile_controller.dart';
import '../../utils/utils.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final ProfileController profileController = Get.put(ProfileController());
  int length = 0;
  int favLength = 0;
  List list = [];
  int index = 0;
  @override
  void initState() {
    super.initState();
    profileController.updateUser(uid);
    getLength();
    getfavlength();
  }

  getfavlength() async {
    favLength = await Utils().getFavLength();
    setState(() {});
  }

  getLength() async {
    length = await Utils().getLength();
    setState(() {});
  }

  final ref = FirebaseDatabase.instance
      .ref()
      .child(FirebaseAuth.instance.currentUser!.uid);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.gray600,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('books').snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return MasonryGridView.builder(
                itemCount: snapshot.data!.docs.length,
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final data = snapshot.data!.docs[index].data();
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BuyBook(
                                  snap: snapshot.data!.docs[index].data())));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            Image.network(
                              data['image'],
                            ),
                            Container(
                              width: double.infinity,
                              height: 40,
                              color: Colors.black.withOpacity(0.7),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            '${data['price'].toString()}.99 \$',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 13),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: InkWell(
                                        onTap: () {
                                          ref
                                              .child('favourites')
                                              .child(data['id'])
                                              .set({
                                            'uid': uid,
                                            'id': data['id'],
                                            'title': data['title'],
                                            'author': data['author'],
                                            'genre': data['genre'],
                                            'image': data['image'],
                                            'ratings': data['ratings'],
                                            'preview': data['preview'],
                                            'price': data['price'],
                                            'language': data['language']
                                          });
                                        },
                                        child: Icon(
                                          Icons.favorite_outline_outlined,
                                          color: Colors.grey.shade100,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: InkWell(
                                        onTap: () {
                                          ref
                                              .child('cart')
                                              .child(data['id'])
                                              .set({
                                            'uid': uid,
                                            'id': data['id'],
                                            'title': data['title'],
                                            'author': data['author'],
                                            'genre': data['genre'],
                                            'image': data['image'],
                                            'ratings': data['ratings'],
                                            'preview': data['preview'],
                                            'price': data['price'],
                                            'language': data['language']
                                          });
                                          Utils().getLength();
                                          // FirebaseFirestore.instance
                                          //     .collection('cart').doc(FirebaseAuth.instance.currentUser!.uid)
                                          //     .set(
                                          //       {
                                          //   'id': data['id'],
                                          //   'title': data['title'],
                                          //   'author': data['author'],
                                          //   'price': data['price'],
                                          //   'genre': data['genre'],
                                          //   'image': data['image'],
                                          //   'preview': data['preview'],
                                          //   'language': data['language']
                                          // });
                                        },
                                        child: Icon(
                                          Icons.add_box,
                                          color: Colors.grey.shade100,
                                          size: 20,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ]),
                    ),
                  );
                });
          }),
    );
  }
}
