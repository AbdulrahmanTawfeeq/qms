import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  final String title;
  final String content;
  final BuildContext context;
  final String btnText;

  const Alert({
    required this.title,
    required this.content,
    required this.context,
    required this.btnText,
    Key? key,
  }) : super(key: key);

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
          style: const ButtonStyle(
            enableFeedback: true,
          ),
          child: Text(btnText),
          onPressed: () => Navigator.pop(context, btnText),
        ),
      ],
    );
  }
}
