import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_challenge1/modules/home/controllers/home_controller.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController homeController = context.watch<HomeController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text("Preview"),
        ),
        Image.network(
          homeController.urlImage,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset("assets/images/preview.png");
          },
        ),
      ],
    );
  }
}