import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

AppBar appBar() {
  return AppBar(
    title: Text(
      "MOBFLIXA",
      style: Theme.of(Modular.routerDelegate.navigatorKey.currentContext!)
          .textTheme
          .headlineMedium!
          .copyWith(
            color: Theme.of(Modular.routerDelegate.navigatorKey.currentContext!)
                .colorScheme
                .primary,
            fontWeight: FontWeight.bold,
          ),
    ),
    centerTitle: true,
  );
}
