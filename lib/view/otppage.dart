

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/view/BottomNavigation.dart';
import 'package:shopapp/view/buttons.dart';
import 'package:shopapp/view/components.dart';
import 'package:shopapp/view/otpform.dart';
import 'package:shopapp/view/tweenainmation.dart';
import 'package:google_fonts/google_fonts.dart';
class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> formKey = GlobalKey();
  // late AnimationController _controller;

  // @override
  // void initState() {
  //   super.initState();

  //   _controller = AnimationController(
  //     duration: const Duration(seconds: 2),
  //     vsync: this,
  //   );
  //   _controller.forward();
  //   _controller.addListener(() {
  //     setState(() {
  //       print(_controller.value);
  //     });
  //   });
  // }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.white,
        title:  Text(
          'OTP_titel'.tr(),
          style: GoogleFonts.dmSerifText(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.grey,
              )
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 30),
          Text(
            "OTP_titel".tr(),
            textAlign: TextAlign.center,
            style: GoogleFonts.dmSerifText(
                fontWeight: FontWeight.bold,
                fontSize: 36,
                color: Colors.black54,
              )
          ),
          const SizedBox(height: 10),
           Text(
            "OTP_text".tr(),
            textAlign: TextAlign.center,
            style:GoogleFonts.dmSerifText(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black54,
              ) ,
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("OTP_text1".tr(),style: GoogleFonts.dmSerifText(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black54,
              ),),
              TweenAnimationText(),
            ],
          ),
          const SizedBox(
            height: 70,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: OtpForm(formKey)),
          const SizedBox(
            height: 70,
          ),
          ButtonsG(
            "Verfy Now",
            kcolor,
            Colors.black,
            () {
              if (formKey.currentState!.validate())  {
                //    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                //      content: Text('Processing Data'),
                // ));
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ));
              }
            },
          ),
          const SizedBox(height: 80),
          GestureDetector(
            onTap: () {},
            child:  Text(
              textAlign: TextAlign.center,
              "OTP_text2".tr(),
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Color.fromARGB(255, 99, 99, 99),
                  color: Color.fromARGB(255, 99, 99, 99)),
            ),
          )
        ],
      ),
    );
  }
}
