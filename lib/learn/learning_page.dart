import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path/path.dart';

// import 'package:flutter_markdown/flutter_markdown.dart';
// import 'package:markdown/markdown.dart' as md;

class LearningPage extends StatefulWidget {
  LearningPage({Key? key}) : super(key: key);

  @override
  _LearningPageState createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {
  FlutterTts flutterTts = FlutterTts();
  var nums = {
    "two is the smallest number in the list": 2,
    "five greater than two": 5,
    "Eight is a good number": 8,
    "three is my lucky number": 3,
    "I found four here": 4,
    "what the hell, seven is less than 8": 7
  };
  Set<String> _stringBuffer = {};
  String? _newTextTospeak;
  // speak
  Future<bool> _speak() async {
    _newTextTospeak = _stringBuffer.first;
    if (_newTextTospeak != null) {
      await flutterTts.awaitSynthCompletion(true);
      await flutterTts.awaitSpeakCompletion(true);
      await flutterTts.speak(_newTextTospeak!);
      _stringBuffer.clear();
    }
    return true;
    // return true;
  }

  Future<bool> _next() async {
    if (await _speak()) return true;
    return false;
  }

  Stream<List<int>> _getItem() async* {
    List<int> slides = [];
    for (var i = 0; i < nums.length; i++) {
      _stringBuffer.add(nums.entries.elementAt(i).key);
      if (await _next()) {
        slides.add(nums.entries.elementAt(i).value);
        yield slides;
      }
    }
  }

  StreamController controller = StreamController<List<int>>();
  bool _playing = true;

  @override
  void initState() {
    super.initState();
    _getItem().listen((event) {
      controller.sink.add(event);
      // print(event);
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          StreamBuilder<List<int>>(
              stream: _getItem(),
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.hasError) {
                  return SizedBox();
                }
                List<int> slide = snapshot.data!;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Text(slide[index].toString());
                  },
                  itemCount: slide.length,
                );
              }),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 24.0,
                right: 8.0,
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _playing = !_playing;
                  });
                },
                child: _playing
                    ? Icon(
                        FontAwesomeIcons.stopCircle,
                        color: Theme.of(context).primaryColor,
                      )
                    : Icon(
                        FontAwesomeIcons.playCircle,
                        color: Theme.of(context).primaryColor,
                      ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      //
                    },
                    child: Icon(
                      FontAwesomeIcons.arrowLeft,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      //
                    },
                    child: Icon(
                      FontAwesomeIcons.arrowRight,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
