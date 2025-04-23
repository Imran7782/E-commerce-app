// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopapp/view/buttons.dart';
import 'package:shopapp/view/components.dart';


class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final Components com=Components();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
                Text(
                  "Profile",
                  style: GoogleFonts.dmSerifText(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.black54
                  )
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 100,

                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.grey,
                      offset: Offset(0, 1),
                      spreadRadius: 2.5,
                    ),
                  ],

                  color: const Color.fromARGB(255, 204, 232, 138),
                ),

                child: Column(
                  children: [
                    SizedBox(height: 10),
                    ListTile(
                      leading: ClipOval(
                        child: SvgPicture.asset(
                          "assets/profile.svg",
                          height: 70,
                          width: 70,
                        ),
                      ),

                      trailing: Icon(Icons.edit, color: Colors.black),
                      title: Text(
                        "Imran mohammed ",
                        style: GoogleFonts.dmSerifText(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
                      ),

                      subtitle: Text(
                        "Imran@gmail.com",
                        style: GoogleFonts.dmSerifText(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black54,
              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                child: Column(
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      separatorBuilder:
                          (context, index) => Divider(
                            color: Colors.white,
                            thickness: 1.1,
                            indent: 15,
                            endIndent: 15,
                          ),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:
                                Colors
                                    .grey
                                    .shade100,
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            leading: com.icon[index],
                            title:com. text[index],
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                        );
                      },
                    ),

                    const Spacer(), // Pushes "Log Out" button to the bottom

                    ButtonsG("Log Out", Colors.red, Colors.white, () {
                     com. logouAlert(context);
                    }),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//  child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                  children: [
                 
                   
                  
//                    SizedBox(
//                      height:80,
//                      width: 80,
//                      child: ClipOval(
//                        child: SvgPicture.asset("assets/profile.svg")
//                      ),
//                    ),
//                    const SizedBox(
//                      height: 20,
//                    ),
//                    const Padding(
//                      padding: EdgeInsets.only(),
//                      child: Text(
//                        "Imran Mohammed ",
//                        style: TextStyle(
//                          color: Colors.black,
//                          fontSize: 16,
//                          fontStyle: FontStyle.italic,
//                        ),
//                      ),
//                    )
//                  ],
//                ),