import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WatchItNowButton extends StatelessWidget {
  const WatchItNowButton({
    super.key,
    required this.videoUrl,
  });
  final Uri videoUrl;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _launchURL();
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

  void _launchURL() async {
    if (await canLaunchUrl(videoUrl)) {
      await launchUrl(videoUrl);
    } else {
      throw 'Could not launch $videoUrl';
    }
  }
}
