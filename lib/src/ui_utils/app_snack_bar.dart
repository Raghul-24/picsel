// import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class AppSnackBar {
  final String? message;
  final String? actionText;
  final VoidCallback? onPressed;
  final bool isPositive;

  const AppSnackBar(
      {required this.message,
      this.actionText,
      this.onPressed,
      this.isPositive = false});

  void showAppSnackBar(BuildContext context) {

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content:
     Text(
            message!.length < 200
                ? message.toString()
                : message.toString().substring(0, 200),
            textAlign: TextAlign.left,
            softWrap: true,
            style: const TextStyle(color: Colors.white),
          ),
      duration: const Duration(seconds: 5),
      backgroundColor: isPositive ? Colors.green : Colors.red,
    ));

  }
}
