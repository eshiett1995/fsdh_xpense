
import 'package:flutter/material.dart';

enum hiveBoxesEnum {
  preference,
  user,
  tags,
  friends
}

class Constants {
  static const Color primaryColor = Color.fromARGB(255, 17, 30, 50);
  static const Color secondaryColor = Color.fromARGB(255, 217, 145, 34);
  static const Color pink65 = Color.fromARGB(180, 240, 105, 105);
  static const Color blackColor = Color.fromARGB(255, 0, 0, 0);
  static const Color lightBlackColor = Color.fromARGB(255, 32, 31, 31);
  static const Color whiteColor = Color.fromARGB(255, 255, 255, 255);
  static const Color ashColor = Color.fromARGB(255, 189, 189, 189);
  static const Color greyishBlueColor = Color.fromARGB(255, 55, 84, 101);
  static const Color lightGrey2Color = Color.fromARGB(255, 79,79,79);
  static const Color skyBlueColor = Color.fromARGB(255, 76, 139, 245);
  static const Color navyBlueColor = Color.fromARGB(255, 59, 89, 152);
  static const Color navyBlueDarkish = Color.fromARGB(255, 41, 64, 78);
  static const Color greenColor = Color.fromARGB(255, 111, 207, 151);

  static const Map<hiveBoxesEnum, String> hiveBoxesNames = {
    hiveBoxesEnum.preference: "preference",
    hiveBoxesEnum.user: "user",
    hiveBoxesEnum.tags: "tags",
    hiveBoxesEnum.friends: "friends"
  };

  static const String mapBoxAccessToken = "pk.eyJ1IjoiZXNoaWV0dDE5OTUiLCJhIjoiY2tpNGZ2ZmExMDB4NjJzcDRsYWZ6a3QzdSJ9.r6UIg4ChHhPE4ppoP2p0NQ";
  static var locationIQAccessToken = "pk.9fd34590e6b81d234599f7a94c97ab44";

}