import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_challenge1/app/common/get_youtube_thumbnail.dart';
import 'package:mobile_challenge1/modules/home/controllers/home_controller.dart';
import 'package:mobile_challenge1/modules/home/views/add_video_screen/widgets/add_video_button.dart';
import 'package:mobile_challenge1/modules/home/views/add_video_screen/widgets/category_dropdown_button.dart';
import 'package:mobile_challenge1/modules/home/views/add_video_screen/widgets/input_text_field.dart';
import 'package:mobile_challenge1/modules/home/views/add_video_screen/widgets/preview_screen.dart';
import 'package:mobile_challenge1/modules/home/views/home_screen/widgets/video_item.dart';

class AlterVideoScreen extends StatelessWidget {
  const AlterVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = context.watch<HomeController>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const InputTextField(),
            const CategoryDropdownButton(),
            PreviewScreen(
                urlForThumb: getYoutubeThumbnail(homeController.urlImage)),
            AddVideoButton(
              buttonLabel: "MODIFICAR",
              onPressed: () {
                homeController.updateVideo(
                  VideoItem(
                    url: homeController.urlImage,
                    category: homeController.dropdownButtonValue,
                    index: homeController.alterIndex,
                  ),
                  homeController.alterIndex,
                );
                //homeController.clearAll();
                Modular.to.navigate("/home/");
              },
            ),
            AddVideoButton(
              buttonLabel: "EXCLUIR",
              onPressed: () {
                homeController.deleteVideo(homeController.alterIndex);
                homeController.clearAll();
                Modular.to.navigate("/home/");
              },
            ),
          ],
        ),
      ),
    );
  }
}
