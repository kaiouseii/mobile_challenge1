import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Dialogs {
  static simpleDialog(String text) {
    return showDialog(
        context: Modular.routerDelegate.navigatorKey.currentContext!,
        builder: (_) {
          return SimpleDialog(
            titlePadding: const EdgeInsets.all(16),
            title: Text(text),
          );
        });
  }
}
