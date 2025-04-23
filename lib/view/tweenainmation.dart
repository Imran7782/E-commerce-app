
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/view/components.dart';


class TweenAnimationText extends StatelessWidget {
  const TweenAnimationText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      onEnd: () {
        ScaffoldMessenger.of(context).showMaterialBanner(
          MaterialBanner(
            backgroundColor: kcolor, // Background color
            padding: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 12), // Padding
            leading: const Icon(Icons.timer_off,
                color: Colors.black,
                size: 28), // Leading icon
            content:  Text(
              "OTP_finshed".tr(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  // Dismiss the MaterialBanner
                  ScaffoldMessenger.of(context)
                      .hideCurrentMaterialBanner();
                },
                child: const Text(
                  "Retry",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      tween: Tween(begin: 5.0, end: 0.0),
      duration: const Duration(seconds: 5),
      builder: (context, value, child) {
        return Text(
          "00:${value.toInt().toString().padLeft(2, "0")}",
          style: const TextStyle(color: Colors.red),
        );
      },
    );
  }
}
