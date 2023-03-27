import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:practice/screens/home/add_a_book.dart';
import 'package:practice/screens/home/favorites.dart';
import 'package:practice/screens/home/shopping_cart.dart';
import 'package:practice/resources/profile_controller.dart';
import 'package:practice/utils/utils.dart';
import 'package:practice/widgets/other_stuff/actionIcon.dart';
import 'package:velocity_x/velocity_x.dart';

class Shopping extends StatefulWidget {
  const Shopping({super.key});

  @override
  State<Shopping> createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
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
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        // drawer: Drawer(
        //   width: width / 1.5,
        //   backgroundColor: Colors.grey.shade900.withOpacity(0.8),
        //   child: SafeArea(
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Center(
        //             child: GetBuilder<ProfileController>(
        //               init: ProfileController(),
        //               builder: (controller) {
        //                 return Text(
        //                   'Hello, ${controller.user['first']}',
        //                   style: GoogleFonts.akshar(
        //                       color: Colors.white, fontSize: 20),
        //                 );
        //               },
        //             ),
        //           ),
        //         ),
        //         const SizedBox(
        //           height: 10,
        //         ),
        //         Row(
        //           children: [
        //             const Padding(
        //               padding: EdgeInsets.all(8.0),
        //               child: Icon(
        //                 size: 20,
        //                 Icons.filter_alt_sharp,
        //                 color: Colors.white,
        //               ),
        //             ),
        //             Padding(
        //               padding: const EdgeInsets.all(8.0),
        //               child: Text(
        //                 'Sort by ',
        //                 style: GoogleFonts.akshar(
        //                     color: Colors.white, fontSize: 20),
        //               ),
        //             ),
        //           ],
        //         ),
        //         const Filters(label: 'Genres', icon: Icons.category_outlined),
        //         const Filters(label: 'Authors', icon: Icons.bookmarks),
        //         const Filters(
        //             label: 'Languages', icon: Icons.language_outlined),
        //       ],
        //     ),
        //   ),
        // ),
        backgroundColor: Vx.gray200,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Vx.black,
          onPressed: () {
            Navigator.push(context,
                (MaterialPageRoute(builder: (context) => const AddBook())));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.book),
              Icon(
                Icons.add,
                size: 8,
              )
            ],
          ),
        ),
        appBar: AppBar(
          leading: VStack([
            VxBox().size(20, 2).white.make(),
            5.heightBox,
            VxBox().size(30, 2).white.make(),
            5.heightBox,
            VxBox().size(15, 2).white.make()
          ]).pOnly(left: 16, top: 20),
          elevation: 0,
          backgroundColor: Vx.black,
          // title: Text(
          //   'Re-Book',
          //   style: GoogleFonts.akshar(fontSize: 22),
          // ),
          // title: Image.asset(
          //   'assets/images/Re-Book.jpg',
          //   height: 30,
          // ),
          actions: [
            VxBox(
              child: ActionIcon(
                  icon: Icons.favorite_outline,
                  route: const Favorites(),
                  length: favLength.toString()),
            ).size(30, 20).make().pOnly(top: 16, right: 10),
            VxBox(
              child: ActionIcon(
                  icon: Icons.shopping_cart,
                  route: const Cart(),
                  length: length.toString()),
            ).size(30, 20).make().pOnly(top: 16, right: 5)
          ],
        ),
        bottomNavigationBar: Container(
          color: Vx.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: GNav(
              selectedIndex: index,
              gap: 8,
              onTabChange: (value) {
                setState(() {
                  index = value;
                });
              },
              backgroundColor: Vx.black,
              color: Vx.white,
              activeColor: Vx.gray400,
              tabBackgroundColor: Vx.gray600,
              padding: const EdgeInsets.all(16),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.sort_outlined,
                  text: 'Sort',
                ),
                GButton(
                  icon: Icons.book_rounded,
                  text: 'Books',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ],
            ),
          ),
        ),
        body: Utils().pages[index]);
  }
}
