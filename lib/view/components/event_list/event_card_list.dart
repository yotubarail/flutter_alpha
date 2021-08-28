// 依存パッケージ
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 参照ファイル
import '/model/events_model.dart';
import '/view_model/signin_view_model.dart';

class EventCardList extends HookWidget {
  const EventCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final eventsList = useProvider(eventsProvider);

    return SizedBox(
      height: deviceHeight * 0.8,
      child: eventsList.when(
        data: (query) {
          return ListView.builder(
            itemCount: query.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.all(8),
                color: Colors.blue[100],
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) {
                          return const Scaffold();
                        },
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 64,
                    child: Center(
                      child: Text(query[index].title),
                    ),
                  ),
                ),
              );
            },
          );
        },
        loading: () {
          return const Center(
            child: Text('読込中...'),
          );
        },
        error: (err, stackTrace) {
          return Center(
            child: Text(err.toString()),
          );
        },
      ),
    );
  }
}
