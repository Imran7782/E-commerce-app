import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/controller/provider.dart';
import 'package:shopapp/view/AccountPage.dart';
import 'package:shopapp/view/Favoirt.dart';
import 'package:shopapp/view/HomeScreen.dart';
import 'package:shopapp/view/components.dart';
import 'package:shopapp/view/mappage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pages = [
    const Home(),
    const Mappage(),
    const AccountPage(),
    const FavoirtScetion(),
  ];
  final Components com = Components();
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return Consumer<Data>(
      builder: (context, data, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: pages[data.currentIndex],
            bottomNavigationBar: CurvedNavigationBar(
              index: data.currentIndex,
              onTap: (value) {
                data.UpdateCurrentIndex(value);
              },

              backgroundColor: Colors.white,
              color: kcolor,
              items: <Widget>[
                com.NavigationIcons(Icons.home),
                com.NavigationIcons(FluentIcons.location_12_filled),
                com.NavigationIcons(Icons.person),
                com.NavigationIcons(Icons.favorite),
              ],
            ),
          ),
        );
      },
    );
  }
}
