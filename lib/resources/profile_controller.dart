import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final Rx<Map<String, dynamic>> _user = Rx<Map<String, dynamic>>({});

  Map<String, dynamic> get user => _user.value;

  final Rx<String> _uid = ''.obs;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  updateUser(String uid) {
    _uid.value = uid;
    getUserData();
  }

  getUserData() async {
    DocumentSnapshot userDoc =
        await firestore.collection('users').doc(_uid.value).get();
    final userData = userDoc.data()! as dynamic;
    String email = userData['email'];
    String first = userData['first'];
    String last = userData['last'];

    _user.value = {
      'email': email,
      'first': first,
      'last': last,
    };
    update();
  }
}
