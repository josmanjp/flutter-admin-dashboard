import 'package:flutter/material.dart';

class NotificationsService {
  //hay que asociar esto en el main.dart al MaterialApp
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      new GlobalKey<ScaffoldMessengerState>();

  static ShowSnackBarError(String message) {
    final snackBar = new SnackBar(
      backgroundColor: Colors.red.withAlpha(230), //red transparente
      content: Text(message, style: TextStyle(color: Colors.white)),
      duration: Duration(seconds: 3),
    );

    messengerKey.currentState!.showSnackBar(snackBar);
  }

  static ShowSnackBarSuccess(String message) {
    final snackBar = new SnackBar(
      backgroundColor: Colors.green.withAlpha(230), //green transparente
      content: Text(message, style: TextStyle(color: Colors.white)),
      duration: Duration(seconds: 3),
    );

    messengerKey.currentState!.showSnackBar(snackBar);
  }
}
