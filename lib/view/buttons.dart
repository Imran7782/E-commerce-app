
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ButtonsG extends StatelessWidget {
  final String t;
  final Color color;
  final Color textcolor;
  final VoidCallback onTap;
   ButtonsG(this.t, this.color, this.textcolor, this.onTap);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Center(
            child: Text(
              t,
              style: GoogleFonts.dmSerifText(
                color: textcolor,
                fontSize: 18,fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic
              )
            ),
          ),
        ),
      ),
    );
  }
}
