import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alpha/model/events_model.dart';
import 'package:flutter_alpha/view/components/event_arguments.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({
    Key? key,
    required this.event,
  }) : super(key: key);
  final Event event;

  @override
  Widget build(BuildContext context) {
    final screenMaxHeight = MediaQuery.of(context).size.height;
    final screenMaxwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: screenMaxHeight * 0.1,
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Text(
                event.title,
                style: const TextStyle(fontSize: 32),
              ),
            ),
          ),
          Container(
            height: screenMaxHeight * 0.6,
            width: screenMaxwidth,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(left: 16, right: 16),
            // child: TextFormField(
            //   initialValue: event.body,
            //   decoration: const InputDecoration(
            //     border: OutlineInputBorder(),
            //   ),
            //   readOnly: true,
            // ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(10),
            ),

            child: Text(
              event.body,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Container(
            height: screenMaxHeight * 0.1,
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Text(
                '申し込み数：${event.guestCount}人',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.all(20),
                ),
              ),
              child: const Text('申し込む'),
            ),
          )
        ],
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<DetailPage> {
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
