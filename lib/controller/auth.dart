import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



FirebaseAuth auth = FirebaseAuth.instance;

Future signup(email,password)async{
  
  try {
     
    UserCredential user=await auth.createUserWithEmailAndPassword(email: email,password: password);
    debugPrint("this user signed in ${user.user?.uid}");
    return true;
  } catch (e) {
        debugPrint("Sign Uo failed becouse : $e");
    return false;

  }

}



Future login(email,password)async{
  
  try {
     
    UserCredential user =await auth.signInWithEmailAndPassword(email: email,password: password);
    debugPrint("this user Loged in ${user.user?.uid}");
    return true;
  } catch (e) {
    debugPrint("Login failed  becouse : $e");
    return false;

  }

}