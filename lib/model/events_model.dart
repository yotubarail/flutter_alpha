import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final eventsProvider = StreamProvider.autoDispose((ref) {
  final stream = FirebaseFirestore.instance
      .collection('users')
      .doc('0001')
      .collection('events')
      .snapshots();
  return stream.map(
      (snapshot) => snapshot.docs.map((doc) => doc.data()['title'].toString()));
});
