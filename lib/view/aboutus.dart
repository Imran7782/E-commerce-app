import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopapp/view/components.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.black,
        backgroundColor: kcolor,
        title: Text(
          "About Us",
          style: GoogleFonts.dmSerifText(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black54,
          ),
        ),
      
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Text(
              "Welcome to Kurd Shop!",
              style:  GoogleFonts.dmSerifText(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.black54,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 10),
            Text(
              ""
              "At Kurd Shop, we believe shopping should be effortless, enjoyable, and accessible to everyone. "
              "That’s why we bring you a seamless shopping experience with a vast collection of top-quality products, from fashion and electronics to home essentials and more."
              "",
              style:  GoogleFonts.dmSerifText(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Our Mission",
              style:  GoogleFonts.dmSerifText(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.black54,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 10),
            Text(
              ""
              "We are committed to providing a secure, convenient, and rewarding shopping experience. "
              "With intuitive navigation, secure payments, and fast delivery, we ensure our customers get the best deals without any hassle."
              "",
              style:  GoogleFonts.dmSerifText(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Why Choose Us?",
              style:  GoogleFonts.dmSerifText(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.black54,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 10),

            listTiles("Wide range of high-quality products"),
            listTiles("Exclusive deals and discounts"),
            listTiles("Fast and reliable delivery"),
            listTiles("Secure payment options"),
            listTiles("24/7 customer support"),

            Text(
              "Start shopping today and experience the future of online shopping with Kurd Shop!",
              textAlign: TextAlign.center,
              style: GoogleFonts.dmSerifText(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class listTiles extends StatelessWidget {
  final String txt;
  const listTiles(this.txt, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.check_circle, color: kcolor),
      title: Text(txt,style:  GoogleFonts.dmSerifText(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black54,
              ),),
    );
  }
}
