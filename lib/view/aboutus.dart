import 'package:easy_localization/easy_localization.dart';
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
          "about_us_text".tr(),
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
              "welcome_to_kurd_shop!".tr(),
              style:  GoogleFonts.dmSerifText(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.black54,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 10),
            Text(
              "about_content1_text".tr(),
              style:  GoogleFonts.dmSerifText(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "our_mission_text".tr(),
              style:  GoogleFonts.dmSerifText(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.black54,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 10),
            Text(
              "our_mission_content_text".tr(),
              style:  GoogleFonts.dmSerifText(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "why_choose_Us_text".tr(),
              style:  GoogleFonts.dmSerifText(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.black54,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 10),

            listTiles("wide_range_of_high-quality_products".tr()),
            listTiles("exclusive_deals_and_discounts".tr()),
            listTiles("fast_and_reliable_delivery".tr()),
            listTiles("secure_payment_options".tr()),
            listTiles("24/7_customer_support".tr()),

            Text(
              "about_last_text".tr(),
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
