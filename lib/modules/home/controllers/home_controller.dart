import 'package:flutter/material.dart';
import 'package:mobile_challenge1/modules/home/views/home_screen/widgets/video_item.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends ChangeNotifier {
  String _dropdownButtonValue = "";
  String _urlImage = "";
  String get dropdownButtonValue => _dropdownButtonValue;
  String get urlImage => _urlImage;
  final List<VideoItem> _listOfVideos = [
    const VideoItem(
        url: "https://i.ytimg.com/vi/otutSrxYpa4/maxresdefault.jpg",
        category: "Trailers")
  ];

  List<VideoItem> get listofVideos => _listOfVideos;

  addVideo(VideoItem videoItem) {
    _listOfVideos.add(videoItem);
    notifyListeners();
  }

  set dropdownButtonValue(String value) {
    _dropdownButtonValue = value;
    notifyListeners();
  }

  set urlImage(String value) {
    _urlImage = value;
    notifyListeners();
  }

  void launchURL(Uri videoUrl) async {
    if (await canLaunchUrl(videoUrl)) {
      await launchUrl(videoUrl);
    } else {
      throw 'Could not launch $videoUrl';
    }
  }
}
