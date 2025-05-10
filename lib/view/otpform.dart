
import 'package:flutter/material.dart';
import 'package:shopapp/view/otpboxes.dart';


class OtpForm extends StatelessWidget {
final List<TextEditingController> otpcontrollr = List.generate(4, (index) => TextEditingController());
 final _formKey;


  OtpForm(
    this._formKey, {super.key}
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(4, (index) {
              return OtpBoxes(
                otpcontrollr[index],
                 (value) {
                  
                if (value.isNotEmpty && index < 3) {
                  FocusScope.of(context).nextFocus();
                } else if (value.isEmpty && index > 0) {
                  FocusScope.of(context).previousFocus();
                }
              });
            })));
  }
}
