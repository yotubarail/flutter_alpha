import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'events_model.freezed.dart';
part 'events_model.g.dart';

final eventsProvider = FutureProvider.autoDispose((ref) async {
  final snapshot =
      await FirebaseFirestore.instance.collectionGroup('events').get();
  final events = snapshot.docs.map((doc) => Item.fromJson(doc.data()));
  return events.toList();
});

@freezed
abstract class Item with _$Item {
  const factory Item(String title, String body, int guestCount) = _Item;
  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}