import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice/screens/auth/auth_page.dart';
import 'package:practice/utils/colors.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Re-Book',
      theme: ThemeData(
          primaryColor: Coolors.secondarycolor,
          fontFamily: GoogleFonts.lato().fontFamily,
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: Coolors.accentColor)),
      home: const AuthPage(),
    );
  }
}
