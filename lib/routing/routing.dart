import 'package:flutter/material.dart';
import 'package:flutter_alpha/main.dart';

Map<String, Widget Function(BuildContext)> routing(BuildContext context) {
  final paths = {
    '/': (BuildContext context) => const Login(),
    '/events': (BuildContext context) => const Events(),
    '/detail': (BuildContext context) => const Detail(),
  };
  return paths;
}
