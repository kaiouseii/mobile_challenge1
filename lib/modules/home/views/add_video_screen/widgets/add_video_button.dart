import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_challenge1/app/common/dialogs.dart';
import 'package:mobile_challenge1/modules/home/controllers/home_controller.dart';
import 'package:mobile_challenge1/modules/home/views/home_screen/widgets/video_item.dart';

class AddVideoButton extends StatelessWidget {
  const AddVideoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController homeController = context.watch<HomeController>();
    return ElevatedButton(
      onPressed: () {
        if (homeController.urlImage == "ERROR" || homeController.urlImage == "") {
          Dialogs.simpleDialog("Por favor, insira uma URL válida");
          return;
        } else if (homeController.dropdownButtonValue == ""){
          Dialogs.simpleDialog("Por favor, selecione em qual categoria gostaria de incluir o vídeo");
          return;
        }
        homeController.addVideo(
          VideoItem(
            url: homeController.urlImage,
            category: homeController.dropdownButtonValue,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "ADICIONAR",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
