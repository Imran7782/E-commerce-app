
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class DrawerListTiles extends StatelessWidget {
  final String txt;
  final IconData icon;
 final VoidCallback onTap;
 final Color color;
  const DrawerListTiles(
    this.color,
    this.icon,
    this.txt, 
    this.onTap,
    
    {super.key}
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: color),
      title:  Text(txt, style: GoogleFonts.dmSerifText(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),),
      trailing: const Icon(Icons.arrow_forward_ios_rounded,
          color: Colors.grey, size: 20),
      onTap: onTap
    );
  }
}