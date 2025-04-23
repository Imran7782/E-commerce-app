import 'package:clippy_flutter/arc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/controller/provider.dart';
import 'package:shopapp/view/components.dart';

class Productview extends StatefulWidget {
  final int index;

  const Productview(this.index, {super.key});
  @override
  State<Productview> createState() => _ProductviewState();
}

class _ProductviewState extends State<Productview> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final productId = widget.index + 1;
    final productName = "Product ${productId}";
    final productPrice = 120.0;
    final productImage = "${productId}.png";
    bool addstate = false;

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 5,
                    color: Colors.grey,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 10),
                   Text(
                    "Product",
                    style: GoogleFonts.dmSerifText(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      fontSize: 28,)
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Provider.of<Data>(context, listen: false).addToFavorite(
                        productId,
                        productImage,
                        productPrice,
                        productName,
                      );
                    },
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
            Arc(
              edge: Edge.BOTTOM,
              arcType: ArcType.CONVEX,
              height: 40,
              child: Container(
                color: kcolor,
                width: double.infinity,
                height: 400,
                child: Center(
                  child: SizedBox(
                    height: 300,
                    child: Image(image: AssetImage("assets/$productImage")),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                productName,
                style: GoogleFonts.padauk(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54
                            )
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  for (int i = 0; i < 4; i++)
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.star,
                        color: const Color.fromARGB(255, 220, 206, 52),
                        size: 24,
                      ),
                    ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.star_border_outlined,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      _bulidFloatbuttons(() {
                        setState(() {
                          if (quantity > 1) quantity--;
                        });
                      }, Icon(Icons.remove, color: Colors.black54)),
                      Text(
                        " ${quantity.toString().padLeft(2, '0')} ",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      _bulidFloatbuttons(() {
                        setState(() {
                          quantity++;
                        });
                      }, Icon(Icons.add, color: Colors.black54)),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "This is the best product for anyone. You can buy it easily at a low price!",
                  style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Size:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                for (int i = 1; i <= 4; i++)
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: FloatingActionButton.small(
                      backgroundColor: Colors.white,
                      onPressed: () {},
                      child: Text(
                        "$i",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Color:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                for (var color in [
                  Colors.green,
                  Colors.red,
                  Colors.deepPurple,
                  Colors.orange,
                ])
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: FloatingActionButton.small(
                      backgroundColor: color,
                      onPressed: () {},
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 100,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      spreadRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: Color(0xffedecf2),
                ),

                
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10,bottom: 10),
                      child: Text(
                        "\$${productPrice.toStringAsFixed(2)}",
                        style: GoogleFonts.pacifico(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 26,
                                                color: Colors.black,
                                             
                                               )
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 20,bottom: 10),
                      child: SizedBox(
                        height: 50,
                        width: 150,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kcolor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            // Add to cart with proper details
                            try {
                              Provider.of<Data>(
                                context,
                                listen: false,
                              ).addToCart(
                                productId,
                                productImage,
                                productPrice,
                                productName,
                              );
                              setState(() {
                                addstate = true;
                              });
                            } on Exception catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: kcolor,
                                  content: Text(
                                    'Added to cart! falled becouse $e',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 14,
                                    ),
                                  ),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }

                            // Show feedback to user
                            if (addstate == true) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: kcolor,
                                  content: Text(
                                    'Added to cart!',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 14,
                                    ),
                                  ),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          },
                          label: const Text(
                            "Add to Cart",
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                          icon: const Icon(
                            Icons.add_shopping_cart,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  FloatingActionButton _bulidFloatbuttons(VoidCallback onPressed, Icon icon) {
    return FloatingActionButton.small(
      backgroundColor: Colors.white,
      onPressed: onPressed,
      child: icon,
    );
  }
}
