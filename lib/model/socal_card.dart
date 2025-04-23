import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:hovering/hovering.dart';


class SocalCard extends StatelessWidget {
 final  String icon;
 final VoidCallback? press;

const  SocalCard(
    this.icon,
    this.press, {super.key}
  );

  @override
  Widget build(BuildContext context) {
    return HoverWidget(
      onHover: (event) {
        
      },
      hoverChild:GestureDetector(
        
        onTap: press,
        child: Container(
          
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 173, 173, 173),
            shape: BoxShape.circle,
      
          ),
          child: SvgPicture.asset(
            
           icon,
          height: 40,
          width: 40,),
        ),
      ) ,
      child: GestureDetector(
        
        onTap: press,
        child: Container(
          
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            shape: BoxShape.circle,
      
          ),
          child: SvgPicture.asset(
            
           icon,
          height: 40,
          width: 40,),
        ),
      ),
    );
  }
}