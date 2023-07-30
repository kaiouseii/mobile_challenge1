import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_challenge1/app/common/dialogs.dart';
import 'package:mobile_challenge1/modules/home/controllers/home_controller.dart';
import 'package:mobile_challenge1/modules/home/views/add_video_screen/widgets/add_video_button.dart';
import 'package:mobile_challenge1/modules/home/views/add_video_screen/widgets/category_dropdown_button.dart';
import 'package:mobile_challenge1/modules/home/views/add_video_screen/widgets/input_text_field.dart';
import 'package:mobile_challenge1/modules/home/views/add_video_screen/widgets/preview_screen.dart';
import 'package:mobile_challenge1/modules/home/views/home_screen/widgets/video_item.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({super.key});

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
            PreviewScreen(urlForThumb: homeController.urlImage),
            AddVideoButton(
              onPressed: () {
                if (homeController.urlImage == "ERROR" ||
                    homeController.urlImage == "") {
                  Dialogs.simpleDialog("Por favor, insira uma URL válida");
                  return;
                } else if (homeController.dropdownButtonValue == "") {
                  Dialogs.simpleDialog(
                      "Por favor, selecione em qual categoria gostaria de incluir o vídeo");
                  return;
                }
                homeController.addVideo(
                  VideoItem(
                    url: homeController.urlImage,
                    category: homeController.dropdownButtonValue,
                    index: homeController.listofVideos.length - 1,
                  ),
                );
                homeController.clearAll();
                ScaffoldMessenger.of(context).showSnackBar(
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
