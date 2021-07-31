import 'package:flutter/foundation.dart';
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
        '/detail': (context) => const Detail(),
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

// イベント一覧Class
class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  _EventsState createState() => _EventsState();

  List<Card> createEventList(BuildContext context) {
    final eventList = <Card>[];
    for (var i = 0; i < 3; i++) {
      final c = createEventCard(
          context: context,
          cardMargin: 4,
          cardHeight: 64,
          eventTitle: '勉強会',
          eventDescription: '勉強会詳細');
      eventList.add(c);
    }
    return eventList;
  }

  Card createEventCard({
    required BuildContext context,
    required double cardMargin,
    required double cardHeight,
    required String eventTitle,
    required String eventDescription,
  }) {
    return Card(
      margin: EdgeInsets.all(cardMargin),
      color: Colors.blue[100],
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            '/detail',
            arguments: EventArguments(
              title: eventTitle,
              description: eventDescription,
            ),
          );
        },
        child: SizedBox(
          height: cardHeight,
          child: Center(
            child: Text(eventTitle),
          ),
        ),
      ),
    );
  }
}

// イベント一覧State
class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final listAreaHeight = deviceHeight * 0.8;
    // final listItemHeight = deviceHeight * 0.08;
    // final listItemMargin = deviceHeight * 0.01;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: listAreaHeight,
            child: ListView(children: widget.createEventList(context)
                // children: [
                //   Card(
                //     margin: EdgeInsets.all(listItemMargin),
                //     color: Colors.blue[100],
                //     child: InkWell(
                //       onTap: () {
                //         Navigator.of(context).pushNamed(
                //           '/detail',
                //           arguments: EventArguments(
                //             title: '勉強会1',
                //             description: '勉強会1の詳細',
                //           ),
                //         );
                //       },
                //       child: SizedBox(
                //         height: listItemHeight,
                //         child: const Center(
                //           child: Text('勉強会 1'),
                //         ),
                //       ),
                //     ),
                //   ),
                //   Card(
                //     margin: EdgeInsets.all(listItemMargin),
                //     color: Colors.blue[100],
                //     child: InkWell(
                //       onTap: () {
                //         Navigator.of(context).pushNamed(
                //           '/detail',
                //           arguments: EventArguments(
                //             title: '勉強会2',
                //             description: '勉強会2の詳細',
                //           ),
                //         );
                //       },
                //       child: SizedBox(
                //         height: listItemHeight,
                //         child: const Center(
                //           child: Text('勉強会 2'),
                //         ),
                //       ),
                //     ),
                //   ),
                //   Card(
                //     margin: EdgeInsets.all(listItemMargin),
                //     color: Colors.blue[100],
                //     child: InkWell(
                //       onTap: () {
                //         Navigator.of(context).pushNamed(
                //           '/detail',
                //           arguments: EventArguments(
                //             title: '勉強会3',
                //             description: '勉強会3の詳細',
                //           ),
                //         );
                //       },
                //       child: SizedBox(
                //         height: listItemHeight,
                //         child: const Center(
                //           child: Text('勉強会 3'),
                //         ),
                //       ),
                //     ),
                //   ),
                //   widget.createEventCard(
                //       context: context,
                //       cardMargin: listItemMargin,
                //       cardHeight: listItemHeight,
                //       eventTitle: '勉強会',
                //       eventDescription: '勉強会の詳細'),
                // ],
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

// イベント詳細Class
class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

// イベント詳細State
class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final titleAreaPadding = deviceHeight * 0.03;
    final detailAreaPadding = deviceHeight * 0.03;

    final arg = ModalRoute.of(context)?.settings.arguments as EventArguments?;
    final EventArguments event;
    if (arg is EventArguments) {
      event = arg;
    } else {
      return const Scaffold();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(titleAreaPadding),
            child: Center(
              child: Text(
                event.getTitle,
                style: const TextStyle(fontSize: 32),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(detailAreaPadding),
            child: Center(
              child: Text(
                arg.getDescription,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.all(20),
              ),
            ),
            child: const Text('申し込む'),
          ),
        ],
      ),
    );
  }
}

class EventArguments {
  EventArguments({required this.title, required this.description});

  String title;
  String description;

  String get getTitle => title;
  String get getDescription => description;
}
