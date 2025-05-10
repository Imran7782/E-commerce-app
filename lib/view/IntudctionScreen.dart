import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shopapp/view/BottomNavigation.dart';
import 'package:shopapp/view/LoginPage.dart';
import 'package:shopapp/view/SignupPgae.dart';
import 'package:shopapp/view/components.dart' as k;
import 'package:shopapp/view/components.dart' ;

TextStyle fstyle = GoogleFonts.dmSerifText(
  fontWeight: FontWeight.bold,
  fontSize: 30,
  color: Colors.black,
);
TextStyle fstyle2=GoogleFonts.dmSerifText(
  fontWeight: FontWeight.bold,
  fontSize: 14,
  color: Colors.black,
);

class IntroductionScreenPage extends StatelessWidget {
  const IntroductionScreenPage({super.key});

  void goToHome(BuildContext context) {
    Navigator.push(
      context,
      Components().ScreenTransitions(HomePage()),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          pages: [
            PageViewModel(
              useScrollView: true,

              titleWidget: Text('hello'.tr(), style: fstyle),

              bodyWidget: const Center(
                child: Icon(
                  Icons.shopping_cart_outlined,
                  size: 100,
                  color: Color.fromARGB(255, 146, 194, 33),
                ),
              ),
              image: SizedBox(
                height: 500,
                width: 380,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SvgPicture.asset("assets/lunching.svg"),
                ),
              ),
              decoration: _pageDecoration(),
            ),
            PageViewModel(
              titleWidget: Text('esy'.tr(), style: fstyle),
              bodyWidget: const Icon(
                Icons.thumb_up_outlined,
                size: 100,
                color: Color.fromARGB(255, 146, 194, 33),
              ),
              image: SizedBox(
                height: 500,
                width: 380,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SvgPicture.asset("assets/shopp.svg"),
                ),
              ),
              decoration: _pageDecoration(),
            ),
            PageViewModel(
              image: SizedBox(
                width: 380,
                child: SvgPicture.asset("assets/webshopping.svg"),
              ),
              titleWidget: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    cursor: "_",

                    textAlign: TextAlign.center,
                    speed: Duration(milliseconds: 150),
                    'getstrted'.tr(),
                    textStyle: fstyle,
                  ),
                ],
              ),

              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 15),
                  _buildButton(
                    'logintext'.tr(),
                    k.kcolor,
                    context,
                    GoogleFontButton(),
                    Loginpage(),
                  ),
                  const SizedBox(height: 20),
                  _buildButton(
                     'signuptext'.tr(),
                    Colors.grey.shade300,
                    context,
                    GoogleFontButton(),
                    SignUpaPage(), 
                  ),
                ],
              ),
              decoration: _pageDecoration(),
            ),
          ],
          onDone: () => goToHome(context),
          onSkip: () => goToHome(context),
          
          skip: Text('skip'.tr(), style: fstyle2),
          next:  Text('next'.tr(), style: fstyle2),
          done:  Text('done'.tr(), style: fstyle2),
          showSkipButton: true,
          dotsDecorator: DotsDecorator(
            size: const Size(10, 10),
            color: Colors.grey,
            activeSize: const Size(20, 10),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            activeColor: k.kcolor,
          ),
        ),
      ),
    );
  }

  TextStyle GoogleFontButton() {
    return GoogleFonts.dmSerifText(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );
  }

  // Reusable Page Decoration
  PageDecoration _pageDecoration() {
    return const PageDecoration(
      pageColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 32,
        fontStyle: FontStyle.italic,
      ),
      bodyTextStyle: TextStyle(color: Colors.teal, fontSize: 20),
    );
  }

  // Reusable Button Widget
  Widget _buildButton(
    String text,
    Color color,
    BuildContext context,
    TextStyle style,
    Widget page,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, Components().ScreenTransitions(page));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: Text(text, style: style)),
        ),
      ),
    );
  }
}
