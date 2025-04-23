import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hovering/hovering.dart';
import 'package:shopapp/model/socal_card.dart';
import 'package:shopapp/view/components.dart' as h;
import 'package:shopapp/view/components.dart' ;
import 'package:shopapp/view/otppage.dart';
import 'package:shopapp/view/welcomscreenLogin.dart';
import 'package:google_fonts/google_fonts.dart';


const kcolor = Color.fromARGB(255, 232, 226, 226);

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String password = "";
  String email = "";
  String confirmpassword='';
  bool obscurepassword=true;
  bool obscureconfirmpassword=true;
  bool isLoading=false;
  final Components com=Components();
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 22,
                    color: Colors.black,
                  ),
                ),

                Text('login_title'.tr(),style: GoogleFonts.dmSerifText(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: Colors.black54,
              ))
              ],
            ),
            
           
            SizedBox(
             
              child: SvgPicture.asset("assets/login.svg",height: 140,width: 200,),
            ),
           
            emailTextF((value) {
              setState(() {
                email = value;
              });
            },'email'.tr()),
            const SizedBox(height: 15),
            passowrdTextF((value) {
              setState(() {
                password = value;
              });
            }, 'password'.tr(),obscurepassword,() {
              obscurepassword=!obscurepassword;
            },),
            const SizedBox(height: 15),
            passowrdTextF((value) {
              confirmpassword=value;
            }, "confirm_password".tr(),obscureconfirmpassword,() {
              obscureconfirmpassword=!obscureconfirmpassword;
            },),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                
              },
              child:  Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 23),
                  child: Text(
                    'forgot_password_Title'.tr()
                    ,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.black,
                      decorationThickness: 1.5,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            HoverWidget(
              hoverChild: GestureDetector(
                onTap: () async {
                  if (email.isEmpty || password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please enter both email and password.")),
                    );
                    debugPrint("Please enter both email and password.");
                    return;
                  }
              
                  // Check if email format is valid
                  bool emailValid = RegExp(
                    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                  ).hasMatch(email);
                  if (!emailValid) {
                      ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please enter a valid email.")),
                    );
                    debugPrint("Please enter a valid email.");
                    return;
                  }
                  if (password!=confirmpassword) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("the passwords do not match")),
                    );
                    print("the passwords do not match");
                    return;
                  }
                setState(() {
                  isLoading=true;
                });
                isLoading? showDialog(
                    context: context,
                    
                    builder: (BuildContext context) {
                      return Center(
                        child: CircularProgressIndicator(
                         color: Colors.blue,
                        ),
                      );
                    },
                  ):null;
              
                  try {
                   await Future.delayed(Duration(seconds: 2),() {
                       Navigator.pop(context);
                    },);
                    // Call login function
                    // bool issucessed = await login(email, password);
              
                    // if (issucessed) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.push(
                        context,
                        Components().ScreenTransitions(Welcomscreenlogin()),
                      );
                    },);
                    // }
                  } catch (e) {
                    // Close the loading dialog after login attempt
                    Navigator.pop(context);
              
                    // Show an error message if login fails
                    String errorMessage =
                        "Login failed. Please check your email and password.";
              
                    if (e is FirebaseAuthException) {
                      if (e.code == 'user-not-found') {
                        errorMessage = "No user found for that email.";
                      } else if (e.code == 'wrong-password') {
                        errorMessage = "Incorrect password.";
                      } else if (e.code == 'invalid-email') {
                        errorMessage = "The email address is not valid.";
                      }else if (e.code=='network-request-failed'){
                        errorMessage = 'No internet connection. Please check your network and try again.';
                      }
                    }
              
                    // Show the error to the user
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(errorMessage)));
                  }finally{
                    setState(() {
                      isLoading=false;
                    });
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: isLoading ?kcolor:const Color.fromARGB(255, 107, 184, 247),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:  Center(
                      child:isLoading? CircularProgressIndicator(color: Colors.blue,): Text(
                        'login_title'.tr(),
                        style:  GoogleFonts.dmSerifText(
                        color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold
                      ),
                      ),
                    ),
                  ),
                ),
              ),
              onHover: (event) {
                print("object");
              },
              child: GestureDetector(
                onTap: () async {
                  if (email.isEmpty || password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please enter both email and password.")),
                    );
                    debugPrint("Please enter both email and password.");
                    return;
                  }
              
                  // Check if email format is valid
                  bool emailValid = RegExp(
                    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                  ).hasMatch(email);
                  if (!emailValid) {
                      ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please enter a valid email.")),
                    );
                    debugPrint("Please enter a valid email.");
                    return;
                  }
                  if (password!=confirmpassword) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("the passwords do not match")),
                    );
                    print("the passwords do not match");
                    return;
                  }
                setState(() {
                  isLoading=true;
                });
                isLoading? showDialog(
                    context: context,
                    
                    builder: (BuildContext context) {
                      return Center(
                        child: CircularProgressIndicator(
                         color: Colors.blue,
                        ),
                      );
                    },
                  ):null;
              
                  try {
                   await Future.delayed(Duration(seconds: 2),() {
                       Navigator.pop(context);
                    },);
                    // Call login function
                    // bool issucessed = await login(email, password);
              
                    // if (issucessed) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.push(
                        context,
                        Components().ScreenTransitions(Welcomscreenlogin()),
                      );
                    },);
                    // }
                  } catch (e) {
                    // Close the loading dialog after login attempt
                    Navigator.pop(context);
              
                    // Show an error message if login fails
                    String errorMessage =
                        "Login failed. Please check your email and password.";
              
                    if (e is FirebaseAuthException) {
                      if (e.code == 'user-not-found') {
                        errorMessage = "No user found for that email.";
                      } else if (e.code == 'wrong-password') {
                        errorMessage = "Incorrect password.";
                      } else if (e.code == 'invalid-email') {
                        errorMessage = "The email address is not valid.";
                      }else if (e.code=='network-request-failed'){
                        errorMessage = 'No internet connection. Please check your network and try again.';
                      }
                    }
              
                    // Show the error to the user
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(errorMessage)));
                  }finally{
                    setState(() {
                      isLoading=false;
                    });
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: isLoading ?kcolor:h.kcolor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:  Center(
                      child:isLoading? CircularProgressIndicator(color: Colors.blue,): Text(
                        'login_title'.tr(),
                        style:  GoogleFonts.dmSerifText(
                        color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold
                      ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    'newusertext'.tr(),
                    style: GoogleFonts.dmSerifText(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54,
              )
                  ),
                ),
                GestureDetector(
                  onTap:
                      () => Navigator.push(
                        context,
                       Components().ScreenTransitions(OtpPage())
                      ),
                  child:  Padding(
                    padding: EdgeInsets.only(),
                    child: Text(
                      "signuptext".tr(),
                      style: GoogleFonts.dmSerifText(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.blue,
              )
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Divider(
                    thickness: 2,
                    color: Color.fromARGB(255, 224, 223, 223),
                    indent: 18,
                    endIndent: 10,
                    height: 30,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'or_title'.tr(),
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 2,
                    color: Color.fromARGB(255, 224, 223, 223),
                    indent: 18,
                    endIndent: 10,
                    height: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocalCard(
                  "assets/facebooklog.svg",
                  () => print("the facbook button pressed !"),
                ),
                SocalCard(
                  "assets/googlelogo.svg",
                  () => print("the google button pressed !"),
                ),
                SocalCard(
                  "assets/Xlogo.svg",
                  // ignore: avoid_print
                  () => print("the X  button pressed !"),
                ),
              ],
            ),
            const SizedBox(height: 10),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                textAlign: TextAlign.center,
                'terms_text'.tr(),
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}

class passowrdTextF extends StatelessWidget {
  final VoidCallback toggle;
  final bool  obsecureText;
  final String _hintxt;
  final ValueChanged<String> onchange;
  const passowrdTextF(
    this.onchange,
    this._hintxt, 
    this.obsecureText,
    this.toggle,
    {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: HoverWidget(
        hoverChild: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 207, 207, 207),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Center(
            child: TextField(
              obscureText: obsecureText,
              onChanged: onchange,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
        
                focusedBorder: InputBorder.none,
                contentPadding: const EdgeInsets.all(10),
                hintText: _hintxt,
                suffix: IconButton(
                  onPressed: toggle,
                   icon: obsecureText? Icon(Icons.visibility_off,color: Colors.black54,):Icon(Icons.visibility,color: Colors.black54,)),
                hintStyle: Components().GoogleTextFFontButton(),
              ),
            ),
          ),
        ),
        onHover: (event) {
          
        },
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 234, 234, 234),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Center(
            child: TextField(
              obscureText: obsecureText,
              onChanged: onchange,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
        
                focusedBorder: InputBorder.none,
                contentPadding: const EdgeInsets.all(10),
                hintText: _hintxt,
                suffix: IconButton(
                  onPressed: toggle,
                   icon: obsecureText? Icon(Icons.visibility_off,color: Colors.black54,):Icon(Icons.visibility,color: Colors.black54,)),
                hintStyle: Components().GoogleTextFFontButton(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}



class emailTextF extends StatelessWidget {

  final String _hintxt;
  final ValueChanged<String> onchange;
  const emailTextF(
    this.onchange,
    this._hintxt, 
    {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: HoverWidget(
        onHover: (event) {
          
        },
        hoverChild:Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 207, 207, 207),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Center(
            child: TextField(
             
              onChanged: onchange,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
        
                focusedBorder: InputBorder.none,
                contentPadding: const EdgeInsets.all(10),
                hintText: _hintxt,
                hintStyle:Components().GoogleTextFFontButton(),
              ),
            ),
          ),
        ),
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 234, 234, 234),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Center(
            child: TextField(
             
              onChanged: onchange,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
        
                focusedBorder: InputBorder.none,
                contentPadding: const EdgeInsets.all(10),
                hintText: _hintxt,
                hintStyle:Components().GoogleTextFFontButton(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
