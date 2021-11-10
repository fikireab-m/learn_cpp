import 'package:learn_cpp/widgets/appbar.dart';

import '/home/learn/outline_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar("Learn C++"),
      body: CourseOutlinePage(),
    );
  }
}
