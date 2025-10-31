import 'package:flutter/material.dart';

class ImageViewPage extends StatelessWidget {
  final String imageUrl;
  final String tag;
  const ImageViewPage({super.key, required this.imageUrl, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Center(
        child: Hero(
          tag: tag,
          child: InteractiveViewer(
            child: Image.asset(imageUrl),
          ),
        ),
      ),
    );
  }
}
