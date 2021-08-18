import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_alpha/view/components/event_arguments.dart';
import 'package:flutter_alpha/view_model/event_view_model.dart';

class Events extends ConsumerWidget {
  const Events({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context, ScopedReader watch) {
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
            child: Column(
              children: [
                for (int i = 0; i < 3; i++)
                  createEventCard(
                    context: context,
                    cardMargin: 4,
                    cardHeight: 64,
                    eventTitle: watch(eventList).state[i],
                    eventDescription: '勉強会詳細',
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
