import 'package:flutter/material.dart';

class VideoItem extends StatelessWidget {
  const VideoItem({
    super.key,
    required this.url,
    required this.category,
  });

  final String url;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        child: Image.network(
          url,
        ),
      ),
    );
  }
}