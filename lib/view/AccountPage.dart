// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopapp/view/buttons.dart';
import 'package:shopapp/view/components.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final Components com = Components();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
                Text(
                  "profile_text".tr(),
                  style: GoogleFonts.dmSerifText(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.grey,
                      offset: const Offset(0, 1),
                      spreadRadius: 2.5,
                    ),
                  ],
                  color: const Color.fromARGB(255, 204, 232, 138),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    ListTile(
                      leading: ClipOval(
                        child: SvgPicture.asset(
                          "assets/profile.svg",
                          height: 70,
                          width: 70,
                        ),
                      ),
                      trailing: const Icon(Icons.edit, color: Colors.black),
                      title: Text(
                        "Imran mohammed ",
                        style: GoogleFonts.dmSerifText(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        "Imran@gmail.com",
                        style: GoogleFonts.dmSerifText(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                children: [
                  ...List.generate(4, (index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade100,
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        leading: com.icon[index],
                        title: com.text[index],
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 30),
                  ButtonsG(
                    "Logout_text".tr(),
                    Colors.red,
                    Colors.white,
                    () {
                      com.logouAlert(context);
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
