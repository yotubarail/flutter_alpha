// 依存パッケージ
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// 参照ファイル
import '/model/auth_model.dart';
import '/model/events_model.dart';
import '/model/guests_model.dart';

// freezed生成ファイル
part 'event_detail_view_model.freezed.dart';

final eventDetailViewModelProvider =
    StateNotifierProvider<EventDetailViewModel, JoinData>(
  (ref) => EventDetailViewModel(),
);

class EventDetailViewModel extends StateNotifier<JoinData> {
  EventDetailViewModel() : super(const JoinData());

  final eventsDB = EventsDB();

  void initEvent({required Event event}) {
    state = state.copyWith(
      id: event.id,
      uid: event.uid,
      guestCount: event.guestCount,
      isJoin: true, //todo
    );
  }

  Future joinEvent() async {
    final can = await canJoinEvent();
    if (can == true) {
      await GuestsDB().setGuests(state.uid, state.id);
      state = state.copyWith(guestCount: state.guestCount + 1, isJoin: true);
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

@freezed
abstract class JoinData with _$JoinData {
  const factory JoinData({
    @Default('') String id,
    @Default('') String title,
    @Default('') String body,
    @Default('') String uid,
    @Default(0) int guestCount,
    @Default(false) bool isJoin,
  }) = _JoinData;
}
