// 依存パッケージ
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// 参照ファイル
import '/model/auth_model.dart';

// freezed 生成ファイル
part 'events_model.freezed.dart';
part 'events_model.g.dart';

final eventsProvider = FutureProvider.autoDispose((ref) async {
  final snapshot =
      await FirebaseFirestore.instance.collectionGroup('events').get();
  final events = snapshot.docs.map((doc) => Event.fromJson(doc.data()));
  return events.toList();
});

final myEventsProvider = FutureProvider.autoDispose((ref) async {
  final user = await ref.watch(authStreamProvider.last);
  late String uid;
  if (user != null) {
    uid = user.uid;
  }
  final snapshot = await FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .collection('events')
      .get();
  final events = snapshot.docs.map((doc) => Event.fromJson(doc.data()));
  return events.toList();
});

class EventsDB {
  Future createEvent() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc('IuXNsHP9h1S97GPvpexNxugUcPE2')
        .collection('events')
        .add(<String, dynamic>{'title': 'test'});
  }

  Future updateEvent(Event event) async {
    await FirebaseFirestore.instance
        .collection('/users/${event.uid}/events/')
        .doc(event.id)
        .update(event.toJson());
  }
}

@freezed
abstract class Event with _$Event {
  const factory Event({
    @Default('') String id,
    @Default('') String title,
    @Default('') String body,
    @Default('') String uid,
    @Default(0) int guestCount,
  }) = _Event;
  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
