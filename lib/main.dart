import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'View/IntudctionScreen.dart';
import 'controller/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    EasyLocalization(
      
      supportedLocales: [Locale('fa'), Locale('en'), Locale('ar'),],
      path: 'assets/translations',
      startLocale: Locale('fa'),
      child: const ShoppingApp(),
      
    ),
  );
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (BuildContext context) => Data(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        locale: context.locale,

        // You can change this dynamically based on user preference
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
       

         
        

        home: safeMatrialapp(),
      ),
    );
  }
}

class safeMatrialapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreenPage();
  }
}
