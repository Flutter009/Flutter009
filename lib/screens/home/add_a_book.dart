// ignore_for_file: avoid_print

import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practice/resources/storage_methods.dart';
import 'package:practice/utils/utils.dart';
import 'package:practice/widgets/text_boxes/my_text_field.dart';
import 'package:flutter/foundation.dart' show Uint8List, kIsWeb;
import 'package:permission_handler/permission_handler.dart';
import 'package:velocity_x/velocity_x.dart';

class AddBook extends StatefulWidget {
  const AddBook({super.key});

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  final TextEditingController title = TextEditingController();
  final TextEditingController author = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController preview = TextEditingController();
  final TextEditingController genre = TextEditingController();
  final TextEditingController language = TextEditingController();

  @override
  void dispose() {
    title.dispose();
    author.dispose();
    price.dispose();
    preview.dispose();
    genre.dispose();
    language.dispose();
    super.dispose();
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  uploadBook() {
    if (title.text.isNotEmpty ||
        author.text.isNotEmpty ||
        imageUrl.text.isNotEmpty ||
        genre.text.isNotEmpty ||
        preview.text.isNotEmpty ||
        language.text.isNotEmpty ||
        price.text.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });
      StorageMethods().uploadBook(title.text, author.text, imageUrl, genre.text,
          preview.text, language.text, price.text);
      setState(() {
        _isLoading = false;
      });
    } else {
      Utils().showSnackBar(context, 'Please fill up all the fields');
    }
    {}
  }

  bool _isLoading = false;
  File _file = File("zz");
  Uint8List webImage = Uint8List(10);
  var imageUrl;
  var uid = FirebaseAuth.instance.currentUser!.uid;

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
      showToast("No file selected");
    }
  }

  Future<PermissionStatus> requestPermissions() async {
    await Permission.mediaLibrary.status;
    return Permission.photos.status;
  }

  // pickFile() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles();
  //   if (result != null) {
  //     _file = result.files.single.bytes;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Vx.gray600,
      appBar: AppBar(
        backgroundColor: Vx.black,
        leading: const Icon(Icons.book),
        title: Text(
          'Add a book',
          style: GoogleFonts.akshar(),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(5)),
                    height: height * 0.2,
                    width: width,
                    child: InkWell(
                      onTap: () => uploadImage(),
                      // onTap: () => pickFile(),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            (_file.path == "zz")
                                ? const Icon(
                                    Icons.folder_open_rounded,
                                    size: 40,
                                    color: Colors.white,
                                  )
                                : (kIsWeb)
                                    ? Image.memory(
                                        webImage,
                                        height: 100,
                                        width: 100,
                                      )
                                    : Image.file(_file,
                                        height: 100, width: 100),
                            _file.path == 'zz'
                                ? Text(
                                    'Upload Cover',
                                    style:
                                        GoogleFonts.akshar(color: Colors.white),
                                  )
                                : Text(
                                    'Image picked successfully',
                                    style:
                                        GoogleFonts.akshar(color: Colors.white),
                                  )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    color: Colors.grey.shade100,
                    height: height * 0.7,
                    width: width,
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.03,
                        ),
                        TextFields(
                            obscure: false, controller: title, hint: 'Title'),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        TextFields(
                            obscure: false, controller: author, hint: 'Author'),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        TextFields(
                            obscure: false,
                            controller: preview,
                            hint: 'Preview'),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        TextFields(
                            obscure: false, controller: genre, hint: 'Genre'),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        TextFields(
                            obscure: false,
                            controller: language,
                            hint: 'Language'),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        TextFields(
                          keyboard: TextInputType.number,
                          obscure: false,
                          controller: price,
                          hint: 'Price',
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Material(
                            elevation: 8,
                            color: Colors.grey.shade200,
                            shadowColor: Vx.gray600,
                            child: InkWell(
                              onTap: () {
                                uploadBook();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade900,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  child: Center(
                                    child: _isLoading
                                        ? const CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : Text(
                                            'Add Book',
                                            style: GoogleFonts.akshar(
                                                color: Colors.grey.shade50,
                                                fontSize: 16),
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
