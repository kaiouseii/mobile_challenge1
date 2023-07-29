import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

FloatingActionButton floatingActionButton(){
  return FloatingActionButton(
        onPressed: () {
          Modular.to.navigate("/home/add");
        },
        child: const Icon(Icons.add_rounded),
      );
}