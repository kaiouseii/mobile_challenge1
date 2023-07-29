import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_challenge1/modules/home/controllers/home_controller.dart';

class TrailerCategory extends StatelessWidget {
  const TrailerCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController homeController = context.watch<HomeController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: homeController.listofVideos,
    );
  }
}