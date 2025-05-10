import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shopapp/controller/provider.dart';
import 'package:shopapp/view/aboutus.dart';
import 'package:shopapp/view/components.dart';
import 'package:shopapp/view/drawerListTiles.dart';
import 'package:google_fonts/google_fonts.dart';


class DrawerSection extends StatefulWidget {
  const DrawerSection({super.key});

  @override
  State<DrawerSection> createState() => _DrawerSectionState();
}

class _DrawerSectionState extends State<DrawerSection> {
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
            DrawerListTiles(Colors.black,Icons.person_4_outlined, "information_text".tr(),() {},),
            DrawerListTiles(Colors.orange,Icons.settings, "Settings_text".tr(),() {  Provider.of<Data>(context,listen: false).UpdateCurrentIndex(2);}),
            DrawerListTiles(Colors.blue,Icons.share_outlined, "Share_text".tr(), () { Share.share("hello can you share it ?",subject: "what ??");},),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Divider(thickness: 1, color: Colors.grey.shade300),
            ),
            DrawerListTiles(Colors.orange.shade700,Icons.info,"aboutUs_text".tr(), () {Navigator.push( context,Components().ScreenTransitions(AboutUs()));},),
            DrawerListTiles(const Color.fromARGB(255, 215, 194, 10),Icons.star_rate, "RateUs_text".tr(), () {},),
            DrawerListTiles(Colors.red,Icons.login_rounded, "Logout_text".tr(), () {com. logouAlert(context);},),
            DrawerListTiles(Colors.blue, Icons.language, "language_change".tr(), () {
              showModalBottomSheet(
                context: context,
                isDismissible: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),  
                builder: (context) {
                  return Container(
                    height: 200,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text("English"),
                          onTap: () {
                            setState(() {
                              context.setLocale(Locale('en'));
                            });
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text("Arabic"),
                          onTap: () {
                            setState(() {
                              context.setLocale(Locale('ar'));
                            });
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text("kurdish"),
                          onTap: () {
                           setState(() {
                              context.setLocale(Locale('fa'));
                           });
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
              
            },),
            DrawerListTiles(Colors.red, Icons.delete_outline,"delete_acccount".tr(), () {
              
              FirebaseAuth auth=FirebaseAuth.instance;
              auth.currentUser!.delete().then((value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Account Deleted Successfully"),backgroundColor: Colors.green,),
                );
              }
             ); },
            )
          ],
        ),
      );
  }
}
