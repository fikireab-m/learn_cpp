import 'package:flutter/widgets.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
  });

  Widget? navigateScreen;
  String imagePath;

  static List<HomeList> homeList = List.generate(
    4,
    (index) => HomeList(
      imagePath: 'assets/images/hotel_booking.png',
      //navigateScreen: const CourseOutlinePage(),
    ),
  );
}
