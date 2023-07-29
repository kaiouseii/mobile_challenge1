import 'package:flutter/material.dart';
import 'package:mobile_challenge1/modules/home/controllers/home_controller.dart';
import 'package:provider/provider.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    super.key,
    this.hintText = "ex: https://www.youtube.com/djopAKDIPSJA",
    this.labelText = "Url do vídeo"
  });

  final String hintText, labelText;

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Provider.of<HomeController>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText),
        TextField(
          onChanged: (value) {
            homeController.urlImage = value;
          },
          decoration: InputDecoration(
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
