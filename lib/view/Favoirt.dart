
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/controller/provider.dart';
import 'package:shopapp/view/components.dart';




class FavoirtScetion extends StatelessWidget {
  const FavoirtScetion({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<Data>(
          builder: (context, cartData, child) {
            return ListView(children: [
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        spreadRadius: 1,
                        color: Colors.grey.withOpacity(0.5),
                        offset: const Offset(0, 3))
                  ],
                  color: kcolor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Provider.of<Data>(context, listen: false)
                              .UpdateCurrentIndex(0);
                        },
                        icon: const Icon(Icons.arrow_back_ios,
                            size: 24, color: Colors.black),
                      ),
                      Text(
                        "favorite_text".tr(),
                        style: GoogleFonts.dmSerifText(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: 26
                        )
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.more_vert,
                        size: 30,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: size.height * 0.9,
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
                          const SizedBox(height: 10),
                          Expanded(
                            child: cartData.favorite.isNotEmpty
                                ? ListView.builder(
                                    itemCount: cartData.favorite.length,
                                    itemBuilder: (context, index) {
                                      final item = cartData.favorite[index];
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                height: 75,
                                                width: 100,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/${item.image}"),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      item.name,
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    const Spacer(),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      child: Text(
                                                        "\$${(item.totalPrice).toStringAsFixed(2)}",
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: IconButton(
                                                        onPressed: () {
                                                          cartData
                                                              .removeFavorite(
                                                                  index);
                                                        },
                                                        icon: const Icon(
                                                          Icons.delete,
                                                          color: Colors.red,
                                                        )),
                                                  ),
                                                
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                :  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        SizedBox(
                                            height: 200,
                                            child: SvgPicture.asset("assets/addTocart.svg")),
                                        SizedBox(
                                          height: 100,
                                        ),
                                        Center(
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            "favorite_sub_text".tr(),
                                            style: TextStyle(
                                              
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FontStyle.italic,
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ]),
                          )
                        ],
                      )))
            ]);
          },
        ),
      ),
    );
  }
}
