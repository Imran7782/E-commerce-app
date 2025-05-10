import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shopapp/controller/auth.dart';
import 'package:shopapp/main.dart';

TextStyle fstyle = GoogleFonts.dmSerifText(
  fontWeight: FontWeight.bold,
  fontSize: 16,
  color: Colors.black,
);
const Color kcolor = Color(0xffc2ea66);

class Components {
  bool isLoading=true;
  List<int> itmes = [1, 2, 3, 4, 5, 6, 7];
  TextStyle stylee = TextStyle(fontWeight: FontWeight.bold);

  Color Titlecolor = Colors.orange.shade700;

  List<IconButton> icon = [
    IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.info_outline_rounded,
        color: Color.fromARGB(255, 143, 108, 5),
      ),
    ),
    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.badge_outlined, color: Colors.blue),
    ),
    IconButton(onPressed: () {}, icon: const Icon(Icons.privacy_tip_outlined)),
    IconButton(
      onPressed: () {},
      icon: Icon(Icons.support_agent, color: Colors.orange.shade700),
    ),
    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.qr_code, color: Colors.black, size: 24),
    ),
    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.edit, color: Colors.black, size: 24),
    ),
  ];

  List<Text> text = [
    Text("personal_information".tr(), style: fstyle),
    Text("cards_mangement".tr(), style: fstyle),
    Text("privcy_and_security".tr(), style: fstyle),
    Text("support_text".tr(), style: fstyle),
  ];

  Future<dynamic> logouAlert(BuildContext context) {
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(
            Icons.warning_amber_rounded,
            color: Colors.redAccent,
            size: 48,
          ),
          backgroundColor: Colors.white,
          title:  Center(
            child: Text(
              "are_you_sure_u_want_to_log_out_?".tr(),
              style: GoogleFonts.dmSerifText(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              )
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton.icon(
              onPressed: () {
                BuildContext safecontex = context;
               
                // Navigator.pop(safecontex);
                showDialog(

                  context: context, 
                  builder: (context) => Center(child: CircularProgressIndicator(color: Colors.blue,)),);
                //this method useful while dealing with apis and wait progresses ,when we press the button it will wiat for 3 second aand then log me out
                Future.delayed(const Duration(seconds: 2), () async {
                  if (safecontex.mounted) {
                    await auth.signOut();
                    //pushandremoveUntile useful when we want to loga out the usere and dont want user return back to home page untile the login again
                   WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.of(safecontex).pushAndRemoveUntil(
                     Components().ScreenTransitions(ShoppingApp()),
                      //it will remove all previouse routes and create new route it prevent the user from login again
                      (route) => false,
                    );
                   },);
                  }
                });
              },
              icon: const Icon(Icons.login_rounded),
              style: ButtonStyle(
                backgroundColor: const WidgetStatePropertyAll(Colors.redAccent),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              label: Text(
                "Logout_text".tr(),
                style: GoogleFonts.dmSerifText(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                )
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close),
              style: ButtonStyle(
                backgroundColor: const WidgetStatePropertyAll(kcolor),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              label: Text(
                "cancel_text".tr(),
                style: GoogleFonts.dmSerifText(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                )
              ),
            ),
          ],
          content: Text(
            "if_you_log_out_you_need_login_again".tr(),
            textAlign: TextAlign.center,
            style: GoogleFonts.dmSerifText(
              color: Colors.black54,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            )
          ),
        );
      },
    );
  }

  Icon NavigationIcons(icon) {
    return Icon(icon, color: Colors.black, size: 30);
  }

  TextStyle GoogleTextFFontButton() {
    return GoogleFonts.dmSerifText(
      color: Colors.black54,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );
  }

  PageTransition<dynamic> ScreenTransitions(screen) {
   return PageTransition(
        // alignment: Alignment.bottomCenter, with rotate
        type: PageTransitionType.fade,
        reverseType: PageTransitionType.fade,
        
        duration: const Duration(milliseconds: 500),
        child: screen);
 }

}
