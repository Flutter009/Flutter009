import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/resources/auth_methods.dart';
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
  }

  void signOut(context) {
    AuthMethods().signOut(context);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          return Scaffold(
              backgroundColor: Vx.gray600,
              body: SafeArea(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Vx.black,
                        radius: 45,
                        child: CircleAvatar(
                          radius: 44,
                          child: Icon(
                            Icons.person,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '${controller.user['first']} ${controller.user['last']}',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                            Container(
                              color: Colors.black45,
                              width: 1,
                              height: 15,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 15),
                            ),
                            Column(
                              children: [
                                Text(
                                  controller.user['email'],
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                            Container(
                              color: Colors.black45,
                              width: 1,
                              height: 15,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 15),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 140,
                          height: 47,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12)),
                          child: Center(
                              child: InkWell(
                                  onTap: () => FirebaseAuth.instance.signOut(),
                                  child: const Text(
                                    'Sign Out',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ))),
                        )
                      ],
                    )
                  ],
                ),
              ));
        });
  }
}
