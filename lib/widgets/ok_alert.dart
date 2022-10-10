import 'package:flutter/material.dart';

class OkAlert extends StatelessWidget {
  final String title;
  final String content;
  final BuildContext context;

  const OkAlert(
      {required this.title,
      required this.content,
      required this.context,
      Key? key})
      : super(key: key);

  void show() {
    showDialog<String>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
