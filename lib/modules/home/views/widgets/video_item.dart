import 'package:flutter/material.dart';

class VideoItem extends StatelessWidget {
  const VideoItem({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        child: Image.asset(
          url,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}