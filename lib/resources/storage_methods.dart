import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:practice/models/book.dart';
import 'package:uuid/uuid.dart';

class StorageMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final FirebaseStorage firebasestorage = FirebaseStorage.instance;

  uploadBook(String title, String author, String image, String genre,
      String preview, String language, String price) async {
    try {
      String uid = _auth.currentUser!.uid;

      // get id
      var allDocs = await firestore.collection('books').get();
      var len = allDocs.docs.length;

      Book book = Book(
          uid: uid,
          id: 'Book $len',
          title: title,
          author: author,
          genre: genre,
          image: image,
          preview: preview,
          language: language,
          price: price);

      await firestore.collection('books').doc('Book $len').set(book.toJson());

      Get.snackbar('Upload Successful',
          'The book $title has been uploaded successfully');
    } catch (e) {
      Get.snackbar('Upload Failed', e.toString());
    }
  }

  Future<String> uploadImageToStorage(String id, File image) async {
    String postId = const Uuid().v1();
    Reference ref =
        firebasestorage.ref().child('covers').child(id).child(postId);
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> uploadProfileToStorage(String id, File image) async {
    String postId = const Uuid().v1();
    Reference ref =
        firebasestorage.ref().child('profile').child(id).child(postId);
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }
  // Future<String> uploadImageToStorage(String childName, Uint8List file) async {
  //   // creating location to our firebase storage

  //   Reference ref =
  //       _storage.ref().child(childName).child(_auth.currentUser!.uid);
  //   String id = const Uuid().v1();
  //   ref = ref.child(id);
  //   // putting in uint8list format -> Upload task like a future but not future
  //   UploadTask uploadTask = ref.putData(file);
  //   TaskSnapshot snapshot = await uploadTask;
  //   String downloadUrl = await snapshot.ref.getDownloadURL();
  //   return downloadUrl;
  // }
}
