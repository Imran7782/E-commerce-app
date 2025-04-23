import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopapp/view/BottomNavigation.dart';
import 'package:shopapp/view/buttons.dart';
import 'package:shopapp/view/components.dart';

class Welcomscreenlogin extends StatelessWidget {
  const Welcomscreenlogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kcolor,
          title:Text("kurd shop",
          textAlign: TextAlign.left
          ,style: GoogleFonts.pacifico(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black)),
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios),color: Colors.black,),
        ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          SizedBox(height: 50,),
         Text(" Hello welcome ✨ ",style: GoogleFonts.dmSerifText(fontWeight: FontWeight.bold,fontSize: 36,color: Colors.black54))
      ,
         Expanded(child: SvgPicture.asset("assets/undraw_welcome.svg")),
         
         
        Text("Welcome to kurd shop you will going to do the best shop Ever!🚀🛍️🛒",
        textAlign: TextAlign.center
        ,style:  GoogleFonts.dmSerifText(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.grey)),
        Spacer(),
      
         ButtonsG("Continue", kcolor, Colors.black, () {
           Navigator.push(context,Components().ScreenTransitions(HomePage()));
         },),
         SizedBox(height: 60,),
      
          ],
        ),
      ),
    );
  }
}