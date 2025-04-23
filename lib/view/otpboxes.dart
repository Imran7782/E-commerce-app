
import 'package:flutter/material.dart';

class OtpBoxes extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onchange;

  const OtpBoxes(this.controller, this.onchange, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 60,
      child: TextFormField(
        
        validator: (value) {
         if (value==null||value.isEmpty) {
           return "";
         }else{
          return null;
         }
        },
        controller: controller,
        onChanged: onchange,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        obscureText: true,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: "",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 56, 50, 50),
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 56, 50, 50))),
        ),
      ),
    );
  }
}
