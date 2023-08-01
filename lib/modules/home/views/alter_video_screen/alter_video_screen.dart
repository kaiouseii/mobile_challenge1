import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_challenge1/app/common/get_youtube_thumbnail.dart';
import 'package:mobile_challenge1/modules/home/controllers/database_helper.dart';
import 'package:mobile_challenge1/modules/home/controllers/home_controller.dart';
import 'package:mobile_challenge1/modules/home/data/task_dao.dart';
import 'package:mobile_challenge1/modules/home/views/add_video_screen/widgets/add_video_button.dart';
import 'package:mobile_challenge1/modules/home/views/add_video_screen/widgets/category_dropdown_button.dart';
import 'package:mobile_challenge1/modules/home/views/add_video_screen/widgets/input_text_field.dart';
import 'package:mobile_challenge1/modules/home/views/add_video_screen/widgets/preview_screen.dart';
import 'package:mobile_challenge1/modules/home/views/home_screen/widgets/video_item.dart';
import 'package:sqflite/sqflite.dart';

class AlterVideoScreen extends StatelessWidget {
  const AlterVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = context.watch<HomeController>();
    DatabaseHelper databaseHelper = Modular.get<DatabaseHelper>();
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
              onPressed: () async{
                Database db = await databaseHelper.database;
                VideoItem videoItem = VideoItem(
                    url: homeController.urlImage,
                    category: homeController.dropdownButtonValue,
                    index: homeController.alterIndex,
                    imageUrl: getYoutubeThumbnail(homeController.urlImage),
                  );
                await TaskDao().update(videoItem, db);
                //homeController.clearAll();
                Modular.to.navigate("/home/");
              },
            ),
            AddVideoButton(
              buttonLabel: "EXCLUIR",
              onPressed: () {
                homeController.deleteVideo(VideoItem(
                    url: homeController.urlImage,
                    category: homeController.dropdownButtonValue,
                    index: homeController.alterIndex,
                    imageUrl: getYoutubeThumbnail(homeController.urlImage),
                  ),);
                //homeController.clearAll();
                Modular.to.navigate("/home/");
              },
            ),
          ],
        ),
      ),
    );
  }
}
