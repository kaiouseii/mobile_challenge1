String getYoutubeThumbnail(String videoUrl) {
  final Uri? uri = Uri.tryParse(videoUrl);

  if (uri == null) {
    return "ERROR";
  }

  return 'https://img.youtube.com/vi/${uri.queryParameters['v']}/0.jpg';
}