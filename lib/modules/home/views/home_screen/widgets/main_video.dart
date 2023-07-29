import 'package:flutter/material.dart';
import 'package:mobile_challenge1/modules/home/views/home_screen/widgets/watch_it_now_button.dart';
class MainVideo extends StatelessWidget {
  const MainVideo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  WatchItNowButton(
                    videoUrl: Uri.parse(
                        "https://www.youtube.com/watch?app=desktop&v=k42HgNZemCQ&ab_channel=NetflixBrasil"),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
