import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_challenge1/modules/home/controllers/home_controller.dart';
import 'package:mobile_challenge1/modules/home/views/home_screen/widgets/video_item.dart';
import 'package:provider/provider.dart';

class AddVideoButton extends StatelessWidget {
  const AddVideoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Provider.of<HomeController>(context);
    return ElevatedButton(
      onPressed: () {
        homeController.addVideo(
          VideoItem(
            url: homeController.urlImage,
            category: homeController.dropdownButtonValue,
          ),
        );
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
