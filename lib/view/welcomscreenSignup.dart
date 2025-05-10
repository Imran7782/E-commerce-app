import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopapp/view/BottomNavigation.dart';
import 'package:shopapp/view/buttons.dart';
import 'package:shopapp/view/components.dart';

class Welcomscreensignup extends StatelessWidget {
  const Welcomscreensignup({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          
          elevation: 20,
          backgroundColor: kcolor,
          title:Text("Kurd Shop",style: GoogleFonts.pacifico(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black),),
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios),color: Colors.black,),
        ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
        SizedBox(height: 60,),  
         Text("hello_welcome_text".tr(),style: TextStyle(fontSize: 38,fontWeight: FontWeight.bold,color: Colors.grey),)
      ,   SizedBox(height: 20,),
         Expanded(child: SvgPicture.asset("assets/undraw_welcoming.svg")),
         SizedBox(height: 20,),
          Text("welcome_signup_page".tr(),
        textAlign: TextAlign.center
        ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey),),
         
         Spacer(),
      
         ButtonsG("continue_text".tr(), kcolor, Colors.black, () {
           Navigator.push(context, Components().ScreenTransitions(HomePage()));
         },),
         SizedBox(height: 60,),
      
          ],
        ),
      ),
    );
  }
}