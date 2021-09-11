// 依存パッケージ
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 参照ファイル
import '/view_model/my_event_detail_view_model.dart';

class EventBody extends HookWidget {
  const EventBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenMaxHeight = MediaQuery.of(context).size.height;
    final state = useProvider(myEventDetailViewModelProvider);
    final stateNotifier = useProvider(myEventDetailViewModelProvider.notifier);

    return Container(
      height: screenMaxHeight * 0.6,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(left: 8, right: 8),
      child: TextFormField(
        initialValue: state.body,
        onChanged: stateNotifier.changeBody,
        maxLines: 100,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
