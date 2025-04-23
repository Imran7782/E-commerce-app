import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/controller/provider.dart';
import 'package:shopapp/view/Drawer.dart';
import 'package:shopapp/view/cartPage.dart';
import 'package:shopapp/view/components.dart';
import 'package:shopapp/view/productView.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

const productstyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String discout = "30%";
  final Components com=Components();
  // String productname='';
  // double expaireTime=0.0;
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  final PageController _pageController = PageController();
  int currentindex = 0;
  void autoscrolling() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      if (currentindex < com.itmes.length - 1) {
        currentindex++;
      } else {
        currentindex = 0;
      }
      _pageController.animateToPage(
        currentindex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    autoscrolling();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (BuildContext context, data, Widget? child) {
        return Scaffold(
          key: _globalKey,
          drawer: const DrawerSection(),
          body: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: kcolor,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 3),
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 4,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),

                child: Padding(
                  padding: EdgeInsets.only(right: 7),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          //we use gologbale Kye becouse we cant acesee to a method from out sied the build method if we use contex it will not work
                          _globalKey.currentState?.openDrawer();
                        },
                        icon: const Icon(
                          Icons.sort,
                          size: 40,
                          color: Colors.black,
                        ),
                      ),
                       Text(
                        "Kurd Shop",
                        style: GoogleFonts.pacifico(
                         fontWeight: FontWeight.bold,
                         color: Colors.black,
                         fontSize: 25,
                        )
                      ),
                      const Spacer(),
                      Badge(
                        offset: Offset(2, 1),
                        alignment: Alignment.topRight,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        label: const Text("3"),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(context, Components().ScreenTransitions(CartPage()));
                          },
                          icon: const Icon(
                            Icons.shopping_cart_sharp,
                            size: 40,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xffedecf2),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),

                      
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: const Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    hintText: "Search ...",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.camera_alt,
                                size: 24,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                       Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Categories",
                            style: GoogleFonts.dmSerifText(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.black54,
              ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: Colors.grey,
                                offset: Offset(0, 1),
                                spreadRadius: 2.5,
                              ),
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: const Color.fromARGB(255, 204, 232, 138),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: Container(
                                  
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.all(Radius.circular(12))
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    spacing: 0.1,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(),
                                        child: RichText(
                                          text: TextSpan(
                                            text: "Only",
                                            style:GoogleFonts.dmSerifText(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black54,
              ),
                                  
                                            children: [
                                              TextSpan(
                                                text: r" 60$",
                                                style: GoogleFonts.pacifico(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.red,
              )
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          r"100$",

                                          style: GoogleFonts.pacifico(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.red,
                decoration: TextDecoration.lineThrough,
                decorationThickness: 1.2
              )
                                        )
                                      ),
                                  
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: RichText(
                                          text: TextSpan(
                                            text: "Discount",
                                            style: GoogleFonts.dmSerifText(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black54,
              ),
                                  
                                            children: [
                                              TextSpan(
                                                text: " %30",
                                                style:  GoogleFonts.pacifico(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.red,
              )
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          "Time left !",
                                          style: GoogleFonts.pacifico(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.red,
              )
                                        ),
                                      ),
                                      
                                  
                                      TweenAnimationBuilder(
                                        tween: Tween(begin: 3600.0, end: 0.0),
                                        duration: Duration(hours: 1),
                                        builder: (context, value, child) {
                                          int munites = value ~/ 60;
                                          double seconds = value % 60;
                                          return Text(
                                            "${munites.toString()} m :${seconds.toStringAsFixed(0)} s",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: PageView.builder(
                                  onPageChanged: (value) {
                                    currentindex = value;
                                  },
                                  controller: _pageController,
                                  itemCount: com.itmes.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Image.asset(
                                        "assets/${com.itmes[index]}.png",
                                        fit: BoxFit.contain,
                                      ),
                                    );
                                  },
                                  pageSnapping: true,
                                  scrollBehavior: ScrollBehavior(),
                                  physics: AlwaysScrollableScrollPhysics(),
                                  padEnds: true,

                                  scrollDirection: Axis.horizontal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: com.itmes.length,
                        axisDirection: Axis.horizontal,
                        onDotClicked: (index) {
                          _pageController.animateToPage(
                            index,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        effect: WormEffect(
                          activeDotColor: const Color.fromARGB(
                            255,
                            170,
                            218,
                            57,
                          ),
                          dotHeight: 10,
                          dotWidth: 10,

                          dotColor: Colors.black12,
                        ),
                      ),

                       Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Items",
                            style: GoogleFonts.dmSerifText(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54
                            )
                          ),
                        ),
                      ),

                      Expanded(
                        child: GridView.builder(
                                                    shrinkWrap: true,
                                                    gridDelegate:
                           const SliverGridDelegateWithFixedCrossAxisCount(
                             childAspectRatio: 0.6,
                             crossAxisCount: 2,
                           ),
                                                    itemCount: 6,
                                                    itemBuilder: (context, index) {
                         return GestureDetector(
                           onTap: () {
                             Navigator.push(
                               context,
                               Components().ScreenTransitions(Productview(index))
                             );
                           },
                           child: Padding(
                             padding: const EdgeInsets.all(10),
                             child: Container(
                               height: 400,
                               decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(20),
                                 boxShadow: [
                                   BoxShadow(
                                     offset: const Offset(0, 3),
                                     color: Colors.grey.withOpacity(0.5),
                                     spreadRadius: 1,
                                     blurRadius: 4,
                                   ),
                                 ],
                               ),
                               child: Column(
                                 children: [
                                   Row(
                                     children: [
                                       Padding(
                                         padding: const EdgeInsets.symmetric(
                                           horizontal: 10,
                                           vertical: 10,
                                         ),
                                         child: Align(
                                           alignment: Alignment.centerLeft,
                                           child: Container(
                                             height: 20,
                                             width: 40,
                                             decoration: BoxDecoration(
                                              //  color: kcolor,
                                               borderRadius:
                                                   BorderRadius.circular(10),
                                             ),
                                             child:  Center(
                                               child: Text(
                                                 "-20%",
                                                 style: GoogleFonts.pacifico(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                 
                                                  foreground: Paint()                                       
                                                    ..color = Colors.red
                                                    ..style = PaintingStyle.fill,
                                                 )
                                               ),
                                             ),
                                           ),
                                         ),
                                       ),
                                       const SizedBox(width: 90),
                                       Icon(
                                         Icons.favorite_border,
                                         color: Colors.orange.shade700,
                                       ),
                                     ],
                                   ),
                                   SizedBox(
                                     height: 160,
                                     child: Padding(
                                       padding: const EdgeInsets.all(10),
                                       child: Image(
                                         image: AssetImage(
                                           "assets/${com.itmes[index]}.png",
                                         ),
                                         fit: BoxFit.cover,
                                       ),
                                     ),
                                   ),
                                    Padding(
                                     padding: EdgeInsets.symmetric(
                                       horizontal: 5,
                                     ),
                                     child: Align(
                                       alignment: Alignment.centerLeft,
                                       child: Text(
                                         "Product Title",
                                         style: GoogleFonts.dmSerifText(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.black,
              )
                                       ),
                                     ),
                                   ),
                                   Padding(
                                     padding: EdgeInsets.symmetric(
                                       horizontal: 5,
                                     ),
                                     child: Align(
                                       alignment: Alignment.centerLeft,
                                       child: Text(
                                         "We write the product descrption here",
                                         style: GoogleFonts.dmSerifText(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black54,
              )
                                       ),
                                     ),
                                   ),
                                   Row(
                                     children: [
                                        Padding(
                                         padding: EdgeInsets.symmetric(
                                           horizontal: 5,
                                         ),
                                         child: Align(
                                           alignment: Alignment.centerLeft,
                                           child: Padding(
                                             padding: EdgeInsets.only(left: 10),
                                             child: Text(
                                               r"60$",
                                               style: GoogleFonts.pacifico(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22,
                                                color: Colors.black,
                                             
                                               )
                                             ),
                                           )
                                         ),
                                       ),
                                       const SizedBox(width: 95),
                                       Icon(
                                         Icons.shopping_cart_checkout,
                                         color: Colors.orange.shade700,
                                       ),
                                     ],
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         );
                                                    },
                                                  ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
