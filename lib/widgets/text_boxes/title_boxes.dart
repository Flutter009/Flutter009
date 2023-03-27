import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopBoxes extends StatelessWidget {
  final String label;
  const ShopBoxes({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 8.0),
      child: SizedBox(
        width: width / 1.7,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(label,
                  style: GoogleFonts.akshar(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
            ),
            SizedBox(
              width: width / 15.5,
            ),
          ],
        ),
      ),
    );
  }
}
