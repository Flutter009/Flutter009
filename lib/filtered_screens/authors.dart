import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:velocity_x/velocity_x.dart';

import '../screens/home/buy_book.dart';

class FilterScreen extends StatefulWidget {
  final String filter;
  final String filtertype;
  const FilterScreen(
      {super.key, required this.filter, required this.filtertype});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final uid = FirebaseAuth.instance.currentUser!.uid;

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Vx.black,
        title: 'Sorted by ${widget.filter} : ${widget.filtertype}'
            .richText
            .white
            .make(),
      ),
      backgroundColor: Vx.gray600,
      body: StreamBuilder(
          stream: _firebaseFirestore
              .collection('books')
              .where(widget.filter, isEqualTo: widget.filtertype)
              .snapshots(),
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
