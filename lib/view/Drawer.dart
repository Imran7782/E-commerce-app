import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shopapp/controller/provider.dart';
import 'package:shopapp/view/aboutus.dart';
import 'package:shopapp/view/components.dart';
import 'package:shopapp/view/drawerListTiles.dart';
import 'package:google_fonts/google_fonts.dart';


class DrawerSection extends StatelessWidget {
  const DrawerSection({super.key});
  

  @override
  Widget build(BuildContext context) {
    final Components com=Components();
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              margin: EdgeInsets.zero, // Removes default margin
              decoration: const BoxDecoration(
               color: kcolor
              ),
              
              
              currentAccountPicture: Container(
                height: 80,
                width: 80,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      spreadRadius: 1,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: SvgPicture.asset("assets/profile.svg",height: 80,width: 80,),
                  )
              ),
              accountName: Text(
                "Imran Mohammed",
                style:  GoogleFonts.dmSerifText(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
              ),
              accountEmail: Text(
                "imran@gmail.com",
                style:  GoogleFonts.dmSerifText(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black54,
              ),
              ),
            ),
            DrawerListTiles(Colors.black,Icons.person_4_outlined, "Information",() {},),
            DrawerListTiles(Colors.orange,Icons.settings, "Settings",() {  Provider.of<Data>(context,listen: false).UpdateCurrentIndex(2);}),
            DrawerListTiles(Colors.blue,Icons.share_outlined, "Share", () { Share.share("hello can you share it ?",subject: "what ??");},),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Divider(thickness: 1, color: Colors.grey.shade300),
            ),
            DrawerListTiles(Colors.orange.shade700,Icons.info,"About Us", () {Navigator.push( context,Components().ScreenTransitions(AboutUs()));},),
            DrawerListTiles(const Color.fromARGB(255, 215, 194, 10),Icons.star_rate, "Rate Us", () {},),
            DrawerListTiles(Colors.red,Icons.login_rounded, "Log out", () {com. logouAlert(context);},)
          ],
        ),
      );
  }
}
