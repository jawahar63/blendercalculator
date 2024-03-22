import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class textlab extends StatelessWidget {
  final String Textmes;
  const textlab({
    super.key,
    required this.Textmes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 30,
      child: Center(
          child: Text(
        Textmes,
        style: GoogleFonts.inriaSans(
          color: Colors.white,
        ),
      )),
    );
  }
}
