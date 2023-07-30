import 'package:flutter/material.dart';
import 'package:mobile_challenge1/modules/home/views/home_screen/widgets/video_item.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends ChangeNotifier {
  String _dropdownButtonValue = "";
  String _urlImage = "";
  int _alterIndex = 0;
  String get dropdownButtonValue => _dropdownButtonValue;
  String get urlImage => _urlImage;
  int get alterIndex => _alterIndex;
  final List<VideoItem> _listOfVideos = [
    const VideoItem(
      url:
          "https://www.youtube.com/watch?v=PKAqMSb2qGw&ab_channel=NetflixBrasil",
      category: "Trailers",
      index: 0,
    )
  ];

  List<VideoItem> get listofVideos => _listOfVideos;

  set dropdownButtonValue(String value) {
    _dropdownButtonValue = value;
    notifyListeners();
  }

  set urlImage(String value) {
    _urlImage = value;
    notifyListeners();
  }

    getAlterInfo(String dropdownButtonValueReceived, String urlImageReceived, int alterIndexReceived) {
    _dropdownButtonValue = dropdownButtonValueReceived;
    _urlImage = urlImageReceived;
    _alterIndex = alterIndexReceived;
    notifyListeners();
  }

  clearAll() {
    _dropdownButtonValue = "";
    _urlImage = "";
    _alterIndex = 0;
    notifyListeners();
  }

  addVideo(VideoItem videoItem) {
    _listOfVideos.add(videoItem);
    notifyListeners();
  }

  updateVideo(VideoItem videoItem, int index) {
    _listOfVideos[index] = videoItem;
    notifyListeners();
  }

  deleteVideo(int index) {
    _listOfVideos.removeAt(index);
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
