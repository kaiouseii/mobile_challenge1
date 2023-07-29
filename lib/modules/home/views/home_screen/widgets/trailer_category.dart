import 'package:flutter/material.dart';
import 'package:mobile_challenge1/modules/home/controllers/home_controller.dart';
import 'package:provider/provider.dart';

class TrailerCategory extends StatelessWidget {
  const TrailerCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Provider.of<HomeController>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: homeController.listofVideos,
    );
  }
}