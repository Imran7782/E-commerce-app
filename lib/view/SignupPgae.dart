import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hovering/hovering.dart';
import 'package:shopapp/model/socal_card.dart';
import 'package:shopapp/view/LoginPage.dart';
import 'package:shopapp/view/components.dart' ;
import 'package:shopapp/view/components.dart' as h;
import 'package:shopapp/view/welcomscreenSignup.dart';
import 'package:google_fonts/google_fonts.dart';


const kcolor = Color.fromARGB(255, 232, 226, 226);

class SignUpaPage extends StatefulWidget {
  const SignUpaPage({super.key});

  @override
  State<SignUpaPage> createState() => _SignUpaPageState();
}

class _SignUpaPageState extends State<SignUpaPage> {
  final Components com=Components();
  String eemail = "";
  String ppassord = "";
  String confirmPassword = "";
  bool isLoading = false;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  bool validateEmail(String email) {
    return RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    ).hasMatch(email);
  }

  bool validatePassword(String password) {
    return password.length >= 6;
  }

 Future<void> _signUp() async {
  // Field validation
  if (eemail.isEmpty || ppassord.isEmpty || confirmPassword.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Please fill in all fields")),
    );
    return;
  }

  if (!validateEmail(eemail)) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Please enter a valid email")),
    );
    return;
  }

  if (!validatePassword(ppassord)) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Password must be at least 6 characters")),
    );
    return;
  }

  if (ppassord != confirmPassword) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Passwords do not match")),
    );
    return;
  }

  // Start loading
  setState(() {
    isLoading = true;
  });

  try {
    // Optional: Let UI show loading state briefly
    await Future.delayed(const Duration(milliseconds: 300));

    // Simulate sign-up logic
    // bool isSignup = await signup(eemail, ppassord);
    // if (isSignup) {

    // Navigate after loading state shows
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
       Components().ScreenTransitions( Welcomscreensignup()),
      );
    });
    // }

  } catch (e) {
    String errorMessage = "Sign up failed. Please try again.";

    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = "The email address is already in use.";
          break;
        case 'weak-password':
          errorMessage = "The password is too weak.";
          break;
        case 'invalid-email':
          errorMessage = "The email address is not valid.";
          break;
      }
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage)),
    );
  } finally {
    // Stop loading only if still on this screen
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }
}

 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size:22,
                      color: Colors.black,
                    ),
                  ),
                    Text("signuptext".tr(),style:GoogleFonts.dmSerifText(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.black54,
              ))
                ],
              ),
              
             SvgPicture.asset("assets/signup.svg",height: 140,width: 140,),
              const SizedBox(height: 50),
              _buildTextField((value) => eemail = value, "email".tr(),),
              const SizedBox(height: 15),
              _buildPasswordField((value) => ppassord = value, "password".tr(), obscurePassword, () {
                setState(() {
                  obscurePassword = !obscurePassword;
                });
              }),
              const SizedBox(height: 15),
              _buildPasswordField((value) => confirmPassword = value, "confirm_password".tr(), obscureConfirmPassword, () {
                setState(() {
                  obscureConfirmPassword = !obscureConfirmPassword;
                });
              }),
              const SizedBox(height: 30),
              _buildSignUpButton(),
              const SizedBox(height: 30),
              _buildLoginRedirect(),
              const SizedBox(height: 20),
              _buildOrDivider(),
              const SizedBox(height: 20),
              _buildSocialButtons(),
              const SizedBox(height: 10),
              _buildTermsAndConditions(),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(ValueChanged<String> onChanged, String hintText) {
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
              onChanged: onChanged,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: const EdgeInsets.all(10),
                hintText: hintText,
                hintStyle: com.GoogleTextFFontButton()
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
              onChanged: onChanged,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: const EdgeInsets.all(10),
                hintText: hintText,
                hintStyle: com.GoogleTextFFontButton()
              ),
            ),
          ),
        ),
      ),
    );
  }

 

  Widget _buildPasswordField(ValueChanged<String> onChanged, String hintText, bool obscureText, VoidCallback onToggle) {
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
              onChanged: onChanged,
              obscureText: obscureText,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: const EdgeInsets.all(10),
                hintText: hintText,
                hintStyle:com.GoogleTextFFontButton(),
                suffixIcon: IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: onToggle,
                ),
              ),
            ),
          ),
        ) ,
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
              onChanged: onChanged,
              obscureText: obscureText,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: const EdgeInsets.all(10),
                hintText: hintText,
                hintStyle:com.GoogleTextFFontButton(),
                suffixIcon: IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: onToggle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return HoverWidget(
      hoverChild:GestureDetector(
        onTap: isLoading ? null : _signUp,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: isLoading?kcolor: Color.fromARGB(255, 107, 184, 247),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: isLoading
                  ? const CircularProgressIndicator(color: Colors.blue)
                  :  Text(
                      "signuptext".tr(),
                      style: GoogleFonts.dmSerifText(
                        color: Colors.black,fontSize: 18, fontWeight: FontWeight.bold
                      ),
                    ),
            ),
          ),
        ),
      ) ,
      onHover: (event) {
        
      },
      child: GestureDetector(
        onTap: isLoading ? null : _signUp,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: isLoading?kcolor:h.kcolor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: isLoading
                  ? const CircularProgressIndicator(color: Colors.blue)
                  :  Text(
                      "signuptext".tr(),
                      style: GoogleFonts.dmSerifText(
                        color: Colors.black,fontSize: 18, fontWeight: FontWeight.bold
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginRedirect() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already_have_an_account?".tr(),
          style: GoogleFonts.dmSerifText(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black54,
              )
        ),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
           Components().ScreenTransitions(Loginpage()),
          ),
          child:  Text(
            "login_title".tr(),
            style: GoogleFonts.dmSerifText(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.blue,
              )
          ),
        ),
      ],
    );
  }

  Widget _buildOrDivider() {
    return  Row(
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
            "or_title".tr(),
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
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocalCard(
          "assets/facebooklog.svg",
          () => print("the facebook button pressed!"),
        ),
        SocalCard(
          "assets/googlelogo.svg",
          () => print("the google button pressed!"),
        ),
        SocalCard(
          "assets/Xlogo.svg",
          () => print("the X button pressed!"),
        ),
      ],
    );
  }

  Widget _buildTermsAndConditions() {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        textAlign: TextAlign.center,
       "terms_text".tr(),
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}