// 依存パッケージ
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 参照ファイル
import '/model/events_model.dart';
import '/view/components/event_detail/event_body.dart';
import '/view/components/event_detail/event_title.dart';
import '/view/components/event_detail/guest_count.dart';
import '/view/components/event_detail/join_button.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({
    Key? key,
    required this.event,
  }) : super(key: key);
  final Event event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          EventTitle(title: event.title),
          EventBody(body: event.body),
          GuestCount(guestCount: event.guestCount),
          const JoinButton(),
        ],
      ),
    );
  }
}
