// 依存パッケージ
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 参照ファイル
// import '/model/auth_model.dart';
import '/model/events_model.dart';
import '/view/components/event_detail/event_body.dart';
import '/view/components/event_detail/event_title.dart';
import '/view/components/event_detail/guest_count.dart';
import '/view/components/event_detail/join_button.dart';
import '/view_model/event_detail_view_model.dart';

class EventDetailPage extends HookWidget {
  const EventDetailPage({
    Key? key,
    required this.event,
  }) : super(key: key);
  final Event event;

  @override
  Widget build(BuildContext context) {
    // final userFuture = Auth().getCurrentUser();
    // final user = useFuture(userFuture);
    useProvider(eventDetailViewModelProvider.notifier).initEvent(event: event);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Detail'),
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
