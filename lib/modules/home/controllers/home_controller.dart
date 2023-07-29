import 'package:url_launcher/url_launcher.dart';

class HomeController{
  void launchURL(Uri videoUrl) async {
    if (await canLaunchUrl(videoUrl)) {
      await launchUrl(videoUrl);
    } else {
      throw 'Could not launch $videoUrl';
    }
  }
}