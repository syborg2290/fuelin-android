import 'package:flutter/material.dart';

class CustomDialogs {
  static Future<void> showMyDialog(
      BuildContext context, String title, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                10.0,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.only(
            top: 5.0,
          ),
          actionsAlignment: MainAxisAlignment.center,
          alignment: Alignment.center,
          title: Center(
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Center(
                      child: Text(
                    message,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Got it'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
