import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final String image;
  final double width;
  final double height;

  const ProfilePicture(
      {super.key, required this.image, this.width = 150, this.height = 150});

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: "profilePicture",
        child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage(image)))));
  }
}
