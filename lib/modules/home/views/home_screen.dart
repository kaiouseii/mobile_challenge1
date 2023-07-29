import 'package:flutter/material.dart';
import 'package:mobile_challenge1/app/common/app_bar.dart';
import 'package:mobile_challenge1/app/common/floating_action_button.dart';
import 'package:mobile_challenge1/modules/home/views/widgets/category_card.dart';
import 'package:mobile_challenge1/modules/home/views/widgets/row_of_categories.dart';
import 'package:mobile_challenge1/modules/home/views/widgets/video_item.dart';
import 'package:mobile_challenge1/modules/home/views/widgets/watch_it_now_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      floatingActionButton: floatingActionButton(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 3.5,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/video_1.jpg",
                    fit: BoxFit.fitWidth,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          WatchItNowButton(videoUrl: Uri.parse("https://www.youtube.com/watch?app=desktop&v=k42HgNZemCQ&ab_channel=NetflixBrasil"),),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                RowOfCategories(),
                CategoryCard(text: "Trailers"),
                VideoItem(url: "assets/images/video_2.jpg"),
                VideoItem(url: "assets/images/video_3.jpg"),
                VideoItem(url: "assets/images/video_4.jpg"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
