import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_challenge1/app/common/dialogs.dart';
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

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({super.key});

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
                urlForThumb: homeController.urlImage.isNotEmpty
                    ? getYoutubeThumbnail(homeController.urlImage)
                    : ""),
            AddVideoButton(
              onPressed: () async {
                if (homeController.urlImage == "ERROR" ||
                    homeController.urlImage == "") {
                  Dialogs.simpleDialog("Por favor, insira uma URL válida");
                  return;
                } else if (homeController.dropdownButtonValue == "") {
                  Dialogs.simpleDialog(
                      "Por favor, selecione em qual categoria gostaria de incluir o vídeo");
                  return;
                }
                VideoItem videoItem = VideoItem(
                  url: homeController.urlImage,
                  category: homeController.dropdownButtonValue,
                  index: homeController.listofVideos.length,
                  imageUrl: getYoutubeThumbnail(homeController.urlImage),
                );
                Database db = await databaseHelper.database;
                await TaskDao().save(videoItem, db);
                ScaffoldMessenger.of(Modular.routerDelegate.navigatorKey.currentContext!).showSnackBar(
                  const SnackBar(
                    content: Text("Vídeo Adicionado com sucesso!"),
                  ),
                );
                Modular.to.navigate("/home/");
              },
            ),
          ],
        ),
      ),
    );
  }
}
