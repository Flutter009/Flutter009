import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:practice/resources/auth_methods.dart';
import 'package:practice/resources/storage_methods.dart';
import 'package:practice/screens/home/edit_profile.dart';
import 'package:practice/utils/utils.dart';
import 'package:practice/widgets/buttons/my_button.dart';
import 'package:practice/widgets/buttons/shop_buttons.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../resources/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    final uid = FirebaseAuth.instance.currentUser!.uid;
    profileController.updateUser(uid);
    getBooks();
  }

  int books = 0;
  getBooks() async {
    books = await Utils().getBooks();
    setState(() {});
  }

  final uid = FirebaseAuth.instance.currentUser!.uid;
  File _file = File("zz");
  Uint8List webImage = Uint8List(10);
  var imageUrl;

  uploadImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      var selected = File(image.path);

      setState(() {
        _file = selected;
      });
      imageUrl = await StorageMethods().uploadImageToStorage(uid, selected);
    } else {
      Utils().showToast("No file selected");
    }
  }

  void signOut(context) {
    AuthMethods().signOut(context);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          return Scaffold(
              backgroundColor: Vx.gray600,
              body: SafeArea(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VxBox()
                            .square(80)
                            .roundedFull
                            .neumorphic(elevation: 30, color: Vx.gray600)
                            .bgImage(DecorationImage(
                                image: NetworkImage(Utils().pic)))
                            .make()
                            .p16(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Vx.black,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: VStack([
                                    '$books'.text.semiBold.white.make().p8(),
                                    'Books Added'.text.white.make().p8(),
                                  ]).p12(),
                                ),
                                14.widthBox,
                                Container(
                                  decoration: BoxDecoration(
                                      color: Vx.black,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: VStack([
                                    '0'.text.semiBold.white.make().p8(),
                                    'Books Bought'.text.white.make().p8(),
                                  ]).p12(),
                                )
                              ],
                            )
                          ],
                        ).p12(),

                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     TextButton(
                        //         onPressed: () {}, child: 'Edit Profile'.text.make())
                        //   ],
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Stack(
                        //     alignment: Alignment.topRight,
                        //     children: [
                        //       CircleAvatar(
                        //         backgroundColor: Vx.black,
                        //         radius: 45,
                        //         child: CircleAvatar(
                        //           backgroundColor: Vx.white,
                        //           radius: 44,
                        //           child: (_file.path == "zz")
                        //               ? const Icon(
                        //                   Icons.folder_open_rounded,
                        //                   size: 40,
                        //                   color: Colors.white,
                        //                 )
                        //               : (kIsWeb)
                        //                   ? Image.memory(
                        //                       webImage,
                        //                       height: 100,
                        //                       width: 100,
                        //                     )
                        //                   : Image.file(_file,
                        //                       height: 100, width: 100),
                        //         ),
                        //       ),
                        //       InkWell(
                        //         onTap: () => uploadImage(),
                        //         child: const CircleAvatar(
                        //           backgroundColor: Vx.black,
                        //           child: CircleAvatar(
                        //             backgroundColor: Vx.white,
                        //             child: Padding(
                        //               padding: EdgeInsets.all(4.0),
                        //               child: Icon(
                        //                 Icons.edit,
                        //                 color: Colors.black,
                        //                 size: 12,
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),

                        Column(
                          children: [
                            // Column(
                            //   children: [
                            //     Padding(
                            //       padding:
                            //           EdgeInsets.symmetric(horizontal: width * 0.2),
                            //       child: Card(
                            //         elevation: 7,
                            //         child: Padding(
                            //           padding: const EdgeInsets.symmetric(
                            //               horizontal: 20.0, vertical: 5),
                            //           child: Row(
                            //             mainAxisAlignment: MainAxisAlignment.start,
                            //             children: [
                            //               Center(
                            //                 child: Text(
                            //                   '${controller.user['first']} ${controller.user['last']}',
                            //                   style: GoogleFonts.abel(
                            //                       fontSize: 20,
                            //                       fontWeight: FontWeight.bold),
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // Padding(
                            //   padding:
                            //       EdgeInsets.symmetric(horizontal: width * 0.2),
                            //   child: Card(
                            //     elevation: 7,
                            //     child: Padding(
                            //       padding: const EdgeInsets.symmetric(
                            //           horizontal: 20.0, vertical: 5),
                            //       child: Column(
                            //         children: [
                            //           Row(
                            //             mainAxisAlignment: MainAxisAlignment.start,
                            //             children: [
                            //               Center(
                            //                 child: Text(
                            //                   controller.user['email'],
                            //                   style: GoogleFonts.abel(
                            //                       fontSize: 20,
                            //                       fontWeight: FontWeight.bold),
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // Center(
                            //     child: InkWell(
                            //         onTap: () => FirebaseAuth.instance.signOut(),
                            //         child: const Text(
                            //           'Sign Out',
                            //           style: TextStyle(
                            //             fontSize: 15,
                            //             color: Colors.lightBlue,
                            //           ),
                            //         )))
                          ],
                        ),
                        // Container(
                        //   margin: const EdgeInsets.only(top: 8),
                        //   width: double.infinity,
                        //   height: 470,
                        //   decoration: BoxDecoration(
                        //     borderRadius: const BorderRadius.only(
                        //       topLeft: Radius.circular(15),
                        //       topRight: Radius.circular(15),
                        //     ),
                        //     color: Colors.grey[100],
                        //   ),
                        //   child: Flex(direction: Axis.vertical, children: [
                        //     StreamBuilder(
                        //         stream: _firebaseFirestore
                        //             .collection('books')
                        //             .where('uid', isEqualTo: uid)
                        //             .snapshots(),
                        //         builder: (context,
                        //             AsyncSnapshot<
                        //                     QuerySnapshot<Map<String, dynamic>>>
                        //                 snapshot) {
                        //           if (snapshot.connectionState ==
                        //               ConnectionState.waiting) {
                        //             return const Center(
                        //               child: CircularProgressIndicator(),
                        //             );
                        //           }

                        //           return MasonryGridView.builder(
                        //               itemCount: snapshot.data!.docs.length,
                        //               gridDelegate:
                        //                   const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        //                       crossAxisCount: 2),
                        //               itemBuilder: (context, index) {
                        //                 final data =
                        //                     snapshot.data!.docs[index].data();
                        //                 return InkWell(
                        //                   onTap: () {
                        //                     Navigator.push(
                        //                         context,
                        //                         MaterialPageRoute(
                        //                             builder: (context) => BuyBook(
                        //                                 snap: snapshot
                        //                                     .data!.docs[index]
                        //                                     .data())));
                        //                   },
                        //                   child: Padding(
                        //                     padding: const EdgeInsets.all(8.0),
                        //                     child: Stack(
                        //                         alignment:
                        //                             AlignmentDirectional.bottomEnd,
                        //                         children: [
                        //                           Image.network(
                        //                             data['image'],
                        //                           ),
                        //                           Container(
                        //                             width: double.infinity,
                        //                             height: 40,
                        //                             color: Colors.black
                        //                                 .withOpacity(0.7),
                        //                             child: Center(
                        //                               child: Row(
                        //                                 mainAxisAlignment:
                        //                                     MainAxisAlignment.end,
                        //                                 children: [
                        //                                   Padding(
                        //                                     padding:
                        //                                         const EdgeInsets
                        //                                             .all(8.0),
                        //                                     child: Row(
                        //                                       children: [
                        //                                         Text(
                        //                                           '${data['price'].toString()}.99 \$',
                        //                                           style: const TextStyle(
                        //                                               color: Colors
                        //                                                   .white,
                        //                                               fontSize: 13),
                        //                                         ),
                        //                                       ],
                        //                                     ),
                        //                                   ),
                        //                                 ],
                        //                               ),
                        //                             ),
                        //                           )
                        //                         ]),
                        //                   ),
                        //                 );
                        //               });
                        //         }),
                        //   ]),
                        // ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: MyButton(
                          text: 'Edit Profile',
                          tap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfile(
                                        first: controller.user['first'],
                                        last: controller.user['last'],
                                        email: controller.user['email'])));
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: MyButton(
                          text: 'Log Out', tap: () => signOut(context)),
                    ),
                  ],
                ),
              ));
        });
  }
}
