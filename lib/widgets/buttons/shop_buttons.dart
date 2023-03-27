import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopButtons extends StatefulWidget {
  final String label;
  final IconData icon;
  const ShopButtons({super.key, required this.label, required this.icon});

  @override
  State<ShopButtons> createState() => _ShopButtonsState();
}

class _ShopButtonsState extends State<ShopButtons> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {},
        child: Container(
          color: Colors.black.withOpacity(0.6),
          width: width / 1.7,
          height: height * 0.04,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                widget.label,
                style: GoogleFonts.akshar(color: Colors.white),
              )),
              const SizedBox(
                width: 5,
              ),
              Icon(
                widget.icon,
                color: Colors.white,
                size: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
