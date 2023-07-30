import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_challenge1/app/common/get_youtube_thumbnail.dart';
import 'package:mobile_challenge1/modules/home/controllers/home_controller.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    super.key,
    this.hintText = "ex: https://www.youtube.com/djopAKDIPSJA",
    this.labelText = "Url do vídeo no youtube",
  });

  final String hintText, labelText;

  @override
  Widget build(BuildContext context) {
    HomeController homeController = context.watch<HomeController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText),
        TextField(
          onChanged: (value) {
            homeController.urlImage = getYoutubeThumbnail(value);
          },
          decoration: InputDecoration(
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
