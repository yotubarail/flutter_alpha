import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// ルーティング
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation with Routes',
      initialRoute: '/login',
      routes: {
        '/login': (context) => const Login(),
        '/events': (context) => const Events(),
      },
    );
  }
}

// ログインClass
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

// イベントClass
class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  _EventsState createState() => _EventsState();
}

// イベントState
class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final listAreaHeight = deviceHeight * 0.8;
    final listItemHeight = deviceHeight * 0.08;
    final listItemMargin = deviceHeight * 0.01;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: listAreaHeight,
            padding: const EdgeInsets.all(4),
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                Card(
                  margin: EdgeInsets.all(listItemMargin),
                  color: Colors.blue[100],
                  child: SizedBox(
                    height: listItemHeight,
                    child: const Center(
                      child: Text('勉強会 1'),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(listItemMargin),
                  color: Colors.blue[100],
                  child: SizedBox(
                    height: listItemHeight,
                    child: const Center(
                      child: Text('勉強会 2'),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(listItemMargin),
                  color: Colors.blue[100],
                  child: SizedBox(
                    height: listItemHeight,
                    child: const Center(
                      child: Text('勉強会 3'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.all(20),
              ),
            ),
            child: const Text('イベント管理'),
          ),
        ],
      ),
    );
  }
}
