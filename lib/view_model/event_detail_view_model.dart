// 依存パッケージ
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 参照ファイル
import '/model/auth_model.dart';
import '/model/events_model.dart';
import '/model/guests_model.dart';

final eventDetailViewModelProvider =
    StateNotifierProvider<EventDetailViewModel, Event>(
  (ref) => EventDetailViewModel(),
);

class EventDetailViewModel extends StateNotifier<Event> {
  EventDetailViewModel() : super(const Event());

  void initEvent({required Event event}) {
    state = state.copyWith(
      id: event.id,
      title: event.title,
      body: event.body,
      uid: event.uid,
      guestCount: event.guestCount,
    );
  }

  Future joinEvent() async {
    final can = await canJoinEvent();
    if (can == true) {
      await EventsDB().incrementGuestCount(state);
      await GuestsDB().setGuests(state.uid, state.id);
      state = state.copyWith(guestCount: state.guestCount + 1);
    }
  }

  Future<bool> canJoinEvent() async {
    final user = Auth().getCurrentUser();
    final guestList = await GuestsDB().getGuests(state.uid, state.id);
    final isJoin = guestList.map((guest) => guest.uid).contains(user.uid);
    if (isJoin == false && user.uid != state.uid) {
      return true;
    } else {
      return false;
    }
  }
}
