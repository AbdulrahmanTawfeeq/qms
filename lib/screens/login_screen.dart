import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Create a global key that uniquely identifies the Form widget
  // Using a GlobalKey is the recommended way to access the form
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool isHidden = true;
  IconData suffixIcon = Icons.visibility_off;
  bool inProgress = false;

  set inProgressState(bool state) {
    setState(() {
      inProgress = state;
    });
  }

  void login() async {
    if (_formKey.currentState!.validate()) {
      inProgressState = true;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
      await Future.delayed(const Duration(seconds: 4));
      inProgressState = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kScreenPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Flexible(
            child: Icon(
              Icons.login_rounded,
              size: kScreenIconSize,
              color: Colors.black,
            ),
          ),
          const Text(
            'Login',
            style: kFont32Bold,
          ),
          Expanded(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the email!';
                      }
                      return null;
                    },
                    onChanged: (inputEmail) {
                      email = inputEmail;
                    },
                    decoration: const InputDecoration(
                      icon: Icon(Icons.alternate_email_outlined),
                      hintText: 'Email',
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the password!';
                      }
                      return null;
                    },
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
                  ElevatedButton(
                    style: ButtonStyle(
                      enableFeedback: true,
                      minimumSize: MaterialStateProperty.all(
                        const Size.fromHeight(50),
                      ),
                    ),
                    onPressed: inProgress ? null : login,
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              style: const ButtonStyle(
                enableFeedback: true,
              ),
              child: const Text('Forget Password?'),
              onPressed: () {},
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('New to QMS ?'),
              TextButton(
                style: const ButtonStyle(
                  enableFeedback: true,
                ),
                child: const Text('Register'),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
