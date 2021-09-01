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

final myEventsProvider = StreamProvider.autoDispose((ref) {
  final user = Auth().getCurrentUser();
  final stream = FirebaseFirestore.instance
      .collection('/users/${user.uid}/events/')
      .snapshots();
  final events = stream.map(
    (snapshot) => snapshot.docs.map(
      (doc) => Event.fromJson(doc.data()),
    ),
  );
  return events;
});

//todo
class EventsDB {
  Future createEvent(Event event) async {
    final user = Auth().getCurrentUser();
    await FirebaseFirestore.instance
        .collection('/users/${user.uid}/events/')
        .doc(event.id)
        .set(event.toJson());
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
