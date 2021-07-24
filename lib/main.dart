import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// ルーティング
// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation with Routes',
      initialRoute: '/login',
      routes: {
        '/login': (_) => const Login(),
      },
    );
  }
}

// ログインクラス
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

// ログインステート
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
              onPressed: () {},
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
