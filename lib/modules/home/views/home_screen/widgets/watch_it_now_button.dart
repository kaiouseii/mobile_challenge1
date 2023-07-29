import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_challenge1/modules/home/controllers/home_controller.dart';


class WatchItNowButton extends StatelessWidget {
  const WatchItNowButton({
    super.key,
    required this.videoUrl,
  });
  final Uri videoUrl;

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Modular.get<HomeController>();
    return ElevatedButton(
      onPressed: () {
        homeController.launchURL(videoUrl);
      },
      child: Text(
        "Assista Agora",
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
