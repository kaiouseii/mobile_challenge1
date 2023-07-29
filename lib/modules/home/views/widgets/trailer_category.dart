import 'package:flutter/material.dart';
import 'package:mobile_challenge1/modules/home/views/widgets/category_card.dart';
import 'package:mobile_challenge1/modules/home/views/widgets/video_item.dart';

class TrailerCategory extends StatelessWidget {
  const TrailerCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        CategoryCard(text: "Trailers"),
        VideoItem(url: "assets/images/video_2.jpg"),
        VideoItem(url: "assets/images/video_3.jpg"),
        VideoItem(url: "assets/images/video_4.jpg"),
      ],
    );
  }
}