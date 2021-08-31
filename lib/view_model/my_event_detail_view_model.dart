// 依存パッケージ
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 参照ファイル
import '/model/events_model.dart';

final myEventDetailViewModelProvider =
    StateNotifierProvider<MyEventDetailViewModel, dynamic>(
  (ref) => MyEventDetailViewModel(),
);

class MyEventDetailViewModel extends StateNotifier<Event> {
  MyEventDetailViewModel() : super(const Event());

  final eventsDB = EventsDB();

  void initEvent({required Event event, required String uid}) {
    state = state.copyWith(
      id: event.id,
      title: event.title,
      body: event.title,
      uid: uid,
    );
  }

  Future createEvent() async {
    // await eventsDB.createEvent();
    // await eventsDB.updateEvent();
  }

  Future updateEvent() async {
    await eventsDB.updateEvent(state);
  }
}
