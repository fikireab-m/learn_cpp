import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:learn_cpp/learn/model/outline.dart';

import '../learning.dart';
import '../learning_page.dart';

class OutlinesList with ChangeNotifier {
  final List<CourseOutline> _courseOutline = [
    CourseOutline(
      number: "00",
      duration: "1:00",
      title: "welcome",
      isDone: true,
      isActive: true,
      navigateScreen: LearningPage(),
    ),
    CourseOutline(
      number: "01",
      duration: "5:35",
      title: "Introduction",
      isDone: false,
      navigateScreen: LearningPage(),
    ),
    CourseOutline(
      number: "02",
      duration: "15:23",
      title: "What's Programming?",
      isDone: false,
      navigateScreen: LearningPage(),
    ),
    CourseOutline(
      number: "03",
      duration: "8:05",
      title: "What's C++?",
      isDone: false,
      navigateScreen: LearningPage(),
    ),
    CourseOutline(
      number: "04",
      duration: "21.13",
      title: "Basics of C++",
      isDone: false,
      navigateScreen: LearningPage(),
    ),
    CourseOutline(
      number: "05",
      duration: "5.25",
      title: "Syntax of C++",
      isDone: false,
      navigateScreen: LearningPage(),
    ),
    CourseOutline(
      number: "06",
      duration: "5.05",
      title: "History",
      isDone: false,
      navigateScreen: LearningPage(),
    ),
  ];

  List<CourseOutline> get getCourseOutlines {
    return UnmodifiableListView(_courseOutline);
  }

  addCourseOutline(CourseOutline outline) {
    _courseOutline.add(outline);
    notifyListeners();
  }

  makeActive(CourseOutline lesson) {
    lesson.isActive = !lesson.isActive;
    notifyListeners();
  }

  makeItDone(CourseOutline lesson) {
    lesson.isDone = !lesson.isDone;
    notifyListeners();
  }

  activateNext(CourseOutline lesson) {
    for (int i = 0; i < getCourseOutlines.length - 1; i++) {
      if (getCourseOutlines[i] == lesson) {
        lesson.isDone = true;
        _courseOutline[i + 1].isActive = true;
      }
    }
  }
}
