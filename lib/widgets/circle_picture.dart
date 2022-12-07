import 'package:flutter/material.dart';
import 'dart:io';

//the profile picture widget that had a different radius depending which platform we are

class CirclePicture extends StatelessWidget {
  final String picutre_path;

  const CirclePicture(this.picutre_path, {super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 56,
        backgroundColor: Colors.black,
        child: CircleAvatar(
            radius: Platform.isAndroid || Platform.isIOS ? 28 : 45,
            backgroundImage: AssetImage(picutre_path)));
  }
}
