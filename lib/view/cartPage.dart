import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/controller/provider.dart';
import 'package:shopapp/view/components.dart' as h;

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<Data>(
          builder: (context, cartData, child) {
            return ListView(
              children: [
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
                    color: h.kcolor
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            // Provider.of<Data>(context, listen: false)
                            //     .UpdateCurrentIndex(0);
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios,
                              size: 24, color: Colors.black),
                        ),
                        const Text(
                          "Carts",
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
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
                  height: size.height * 0.7,
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
                          child: cartData.itemcart.isNotEmpty
                              ? ListView.builder(
                                  itemCount: cartData.itemcart.length,
                                  itemBuilder: (context, index) {
                                    final item = cartData.itemcart[index];
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
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: IconButton(
                                                      onPressed: () {
                                                        cartData.removeFromCart(
                                                            index);
                                                      },
                                                      icon: const Icon(
                                                        Icons.delete,
                                                        color: Colors.red,
                                                      )),
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      height: 23,
                                                      width: 23,
                                                      child:
                                                          FloatingActionButton(
                                                        backgroundColor:
                                                            Colors.white,
                                                        onPressed: () {
                                                          cartData
                                                              .decrement(index);
                                                        },
                                                        child: const Icon(
                                                          Icons.remove,
                                                          color: Colors.black,
                                                          size: 12,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      "${item.quantity}"
                                                          .padLeft(2, "0"),
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 23,
                                                      width: 23,
                                                      child:
                                                          FloatingActionButton(
                                                        backgroundColor:
                                                            Colors.white,
                                                        onPressed: () {
                                                          cartData
                                                              .increment(index);
                                                        },
                                                        child: const Icon(
                                                          Icons.add,
                                                          color: Colors.black,
                                                          size: 12,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
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
                                        child: SvgPicture.asset("assets/emptycart.svg")
                                      ),
                                      SizedBox(
                                        height: 100,
                                      ),
                                      Center(
                                        child: Text(
                                          "Your cart is empty",
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ]),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(10),
                        //   child: InkWell(
                        //     onTap: () {},
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       children: [
                        //         Container(
                        //             decoration: const BoxDecoration(
                        //               shape: BoxShape.circle,
                        //               color: Color.fromARGB(255, 0, 150, 85),
                        //             ),
                        //             child: const Icon(Icons.add,
                        //                 color: Colors.white, size: 20)),
                        //         const SizedBox(width: 5),
                        //         const Text(
                        //           "Add Coupon code ",
                        //           style: TextStyle(
                        //               fontWeight: FontWeight.bold,
                        //               color: Colors.black,
                        //               fontSize: 18),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const Text(
                        "Total",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18),
                      ),
                      const Spacer(),
                      Text(
                        "\$${cartData.totalPrice.toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: h.kcolor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      onPressed: cartData.itemcart.isEmpty
                          ? null
                          : () {
                              // Checkout functionality would go here
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Processing checkout...'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                      child: const Text("Check Out",
                          style: TextStyle(fontSize: 18, color: Colors.black)),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
