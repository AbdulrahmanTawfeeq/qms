import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qms/screens/login_screen.dart';

void main() {
  runApp(const QMS());
}

class QMS extends StatelessWidget {
  const QMS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Queue Management System',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: LoginScreen(),
      ),
    );
  }
}
