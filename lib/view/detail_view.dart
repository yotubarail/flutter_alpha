import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alpha/view/components/event_arguments.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

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
