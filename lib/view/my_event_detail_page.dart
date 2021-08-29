// 依存パッケージ
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 参照ファイル
import '/model/events_model.dart';
import '/view/components/my_event_detail/body_form.dart';
import '/view/components/my_event_detail/guest_count.dart';
import '/view/components/my_event_detail/save_button.dart';
import '/view/components/my_event_detail/title_form.dart';

class MyEventDetailPage extends StatelessWidget {
  const MyEventDetailPage({
    Key? key,
    required this.event,
  }) : super(key: key);
  final Event event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Event Detail'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TitleForm(title: event.title),
          EventBody(body: event.body),
          GuestCount(guestCount: event.guestCount),
          const JoinButton(),
        ],
      ),
    );
  }
}
