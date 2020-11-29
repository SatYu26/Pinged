import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TestingScreen extends StatefulWidget {
  @override
  _TestingScreenState createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {
  String imageURL =
      "https://quotefancy.com/media/wallpaper/3840x2160/1700728-Linus-Torvalds-Quote-Talk-is-cheap-Show-me-the-code.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CachedNetworkImage(
          imageUrl: imageURL,
          placeholder: (context, url) => Image.asset("assets/chat2x.jpeg")),
    );
  }
}
