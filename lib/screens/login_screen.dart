import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qms/widgets/ok_alert.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';
  bool isHidden = true;
  IconData suffixIcon = Icons.visibility_off;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.login_rounded,
            size: 150,
            color: Colors.black,
          ),
          const Text(
            'Login',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            onChanged: (inputEmail) {
              email = inputEmail;
            },
            decoration: const InputDecoration(
              icon: Icon(Icons.alternate_email_outlined),
              hintText: 'Email',
            ),
          ),
          TextField(
            obscureText: isHidden,
            enableSuggestions: false,
            autocorrect: false,
            onChanged: (inputPassword) {
              password = inputPassword;
            },
            decoration: InputDecoration(
              icon: const Icon(Icons.lock_outline),
              hintText: 'Password',
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isHidden = isHidden ? false : true;
                    suffixIcon = suffixIcon == Icons.visibility
                        ? Icons.visibility_off
                        : Icons.visibility;
                  });
                },
                child: Icon(suffixIcon),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              child: const Text('Forget Password?'),
              onPressed: () {},
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                const Size.fromHeight(50),
              ),
            ),
            onPressed: () {
              if (email.isEmpty || password.isEmpty) {
                OkAlert(
                  title: 'Login Feedback',
                  content: 'Empty username or password!',
                  context: context,
                ).show();
              } else {
                OkAlert(
                  title: 'Login Feedback',
                  content: '$email $password',
                  context: context,
                ).show();
              }
            },
            child: const Text('Login'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('New to QMS ?'),
              TextButton(
                onPressed: () {},
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Register'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
