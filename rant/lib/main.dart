import 'package:flutter/material.dart';
import 'package:rant/screens/crop_image.dart';
import 'package:rant/screens/profile.dart';
import 'package:rant/screens/profile_details.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/profile_details": (context) => ProfileDetails(),
        "/profile_crop": (context) => ImageCrop(),
      },
      home: UserProfile(),
    );
  }
}
