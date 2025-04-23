import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          title:Text("Kurd Shop",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),),
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios),color: Colors.black,),
        ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
        SizedBox(height: 60,),  
         Text("Hello,welcome ✨ ",style: TextStyle(fontSize: 38,fontWeight: FontWeight.bold,color: Colors.grey),)
      ,   SizedBox(height: 20,),
         Expanded(child: SvgPicture.asset("assets/undraw_welcoming.svg")),
         SizedBox(height: 20,),
          Text("Welcome to Kurd Shop! Amazing deals and an unforgettable shopping journey await you!🚀🎊🥳",
        textAlign: TextAlign.center
        ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey),),
         
         Spacer(),
      
         ButtonsG("Continue", kcolor, Colors.black, () {
           Navigator.push(context, Components().ScreenTransitions(HomePage()));
         },),
         SizedBox(height: 60,),
      
          ],
        ),
      ),
    );
  }
}