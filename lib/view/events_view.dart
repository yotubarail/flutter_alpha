import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_alpha/view/components/event_arguments.dart';
import 'package:flutter_alpha/view_model/events_view_model.dart';
import 'package:flutter_alpha/model/events_model.dart';

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

    final events = watch(eventsProvider);
    print(events);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            // StreamProviderから受け取った値は .when() で状態に応じて出し分けできる
            child: events.when(
              // 値が取得できたとき
              data: (query) {
                return ListView.builder(
                  itemCount: query.length,
                  itemBuilder: (context, index) {
                    return Text(query[index].title);
                    // return Text('test');
                  },
                );
              },
              // 値が読込中のとき
              loading: () {
                return const Center(
                  child: Text('読込中...'),
                );
              },
              // 値の取得に失敗したとき
              error: (e, stackTrace) {
                return Center(
                  child: Text(e.toString()),
                );
              },
            ),
          ),
          // SizedBox(
          //   height: listAreaHeight,
          //   child: Column(
          //     children: [
          //       for (int i = 0; i < 3; i++)
          //         createEventCard(
          //           context: context,
          //           cardMargin: 4,
          //           cardHeight: 64,
          //           eventTitle: watch(eventList).state[i],
          //           eventDescription: '勉強会詳細',
          //         ),
          //     ],
          //   ),
          // ),
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
