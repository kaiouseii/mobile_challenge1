import 'package:flutter/material.dart';
import 'package:mobile_challenge1/modules/home/views/add_video_screen/widgets/add_video_button.dart';
import 'package:mobile_challenge1/modules/home/views/add_video_screen/widgets/category_dropdown_button.dart';
import 'package:mobile_challenge1/modules/home/views/add_video_screen/widgets/input_text_field.dart';
import 'package:mobile_challenge1/modules/home/views/add_video_screen/widgets/preview_screen.dart';

class AlterVideoScreen extends StatelessWidget {
  const AlterVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            InputTextField(),
            CategoryDropdownButton(),
            PreviewScreen(),
            AddVideoButton()
          ],
        ),
      ),
    );
  }
}