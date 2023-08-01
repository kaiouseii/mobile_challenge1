import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_challenge1/modules/home/controllers/home_controller.dart';

class VideoItem extends StatelessWidget {
  const VideoItem({
    super.key,
    required this.url,
    required this.category,
    required this.index,
    required this.imageUrl,
  });

  final String url;
  final String category;
  final String imageUrl;
  final int index;

  @override
  Widget build(BuildContext context) {
    HomeController homeController = context.watch<HomeController>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: (){
          homeController.launchURL(Uri.parse(url));
        },
        onLongPressEnd: (_) {
          homeController.getAlterInfo(category, url, index);
          Modular.to.navigate("/home/alter");
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          child: Image.network(
            imageUrl,
          ),
        ),
      ),
    );
  }

  toMap(){
    return {
      "id": index,
      "sourceUrl": url,
      "imageUrl":imageUrl,
      "category": category, 
    };
  }
}
