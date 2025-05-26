import 'package:flutter/material.dart';

class AlertMessage {
  void showAlert(BuildContext context, String message, bool status) {
    Color? fillColor = status ? Colors.green[200] : Colors.red[200];
    Color borderColor = status ? Colors.green : Colors.red;

    final snackBar = SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      content: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: fillColor,
          border: Border.all(color: borderColor, width: 3),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(status ? Icons.check_circle : Icons.error, color: borderColor),
            SizedBox(width: 10),
            Expanded(child: Text(message, style: TextStyle(color: Colors.black))),
            IconButton(
              icon: Icon(Icons.close, color: Colors.black),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            )
          ],
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
