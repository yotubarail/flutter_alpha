import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

// ログインState
class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/events');
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.all(20),
                ),
              ),
              child: const Text('ログイン'),
            ),
          ],
        ),
      ),
    );
  }
}
