import 'package:flutter/material.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({
    super.key,
    required this.urlForThumb,
  });
final String urlForThumb;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text("Preview"),
        ),
        Image.network(
          urlForThumb,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset("assets/images/preview.png");
          },
        ),
      ],
    );
  }
}