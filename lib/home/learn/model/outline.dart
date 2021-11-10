import 'package:flutter/widgets.dart';

class CourseOutline {
  CourseOutline({
    this.navigateScreen,
    required this.number,
    required this.duration,
    required this.title,
    this.isDone = false,
    this.isActive = false,
  });

  Widget? navigateScreen;
  String number;
  String duration;
  String title;
  bool isDone;
  bool isActive;
}
