import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LearningPage extends StatefulWidget {
  const LearningPage({Key? key}) : super(key: key);

  @override
  _LearningPageState createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {
  var nums = {
    "What's C++?": [
      '''C++ is a cross-platform language that can be used to create high-performance applications.''',
      '''It was developed by Bjarne Stroustrup at Bell labs in 1979, as an OOP extension to the C language.''',
      '''C++ gives programmers a high level of control over system resources and memory.''',
      '''The language was updated 3 major times in 2011, 2014, and 2017 to C++11, C++14, and C++17.
'''
    ],
    "Why you learn C++?": [
      '''
C++ is one of the world's most popular programming languages.''',
      '''C++ is portable and can be used to develop applications, and video games that can be adapted to multiple platforms.''',
      '''Hey, C++ is fun and easy to learn.''',
      '''So, let's go learn some codding.''',
    ],
    "Get Started": [
      '''
To start using C++, you need two things:
1. A text editor, like Notepad, to write C++ code
2. Acompiler, like GCC, to translate the C++ code into a language that the computer will understand.''',
      '''
There are many text editors and compilers to choose from. In this tutorial, we will use an IDE (Integrated Development Environment) called **Code::Blocks**, which we believe is a good place to start.''',
      '''You can also use web-based IDEs, but thier functionality may be limited.''',
      '''👉 Watch how to install and configure Code::Blocks IDE on [Watch our video tutorial](http://www.codeblocks.org/downloads/26).'''
    ],
    "Hello World": [
      '''
Now, we are all set to write our first C++ program
- [x] Open Codeblocks and create an _empty file_.
- [x] Write the following code and save the file as _hello.cpp_.
''',
      '''
``` c++
#include <iostream>
using namespace std;

int main() {
  cout << "Hello World!";
  return 0;
}
```
''',
      '''
Then, go to **Build > Build and Run** to run (execute) the program. Your output should look like:
```
Hello World!
Process returned 0 (0x0) execution time : 0.011 s
Press any key to continue.
```
''',
      '''> 👍 **Congratulations!** You have now written and executed your first C++ program.
👉 [Watch our video tutorial](http://www.codeblocks.org/downloads/26) for more detail.
'''
    ]
  };
  FlutterTts flutterTts = FlutterTts();

  Set<String> notes = {};
  Stream<Set<String>> getNotes(slideI, int noteI) async* {
    var currentSlide = nums.entries.elementAt(slideI).value;
    notes.add(currentSlide.elementAt(noteI));
    yield notes;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String? _newTextTospeak;
  // speak
  Future _speak() async {
    if (_newTextTospeak != null) {
      // await flutterTts.awaitSynthCompletion(true);
      // await flutterTts.awaitSpeakCompletion(true);

      await flutterTts.speak(_newTextTospeak!);
    }
  }

  bool _playing = true;
  bool menuIsOpen = false;
  double fontsize = 18.0;
  int slideIndex = 0;
  int noteIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 16.0,
          backgroundColor: Colors.black,
          title: Text(nums.entries.elementAt(slideIndex).key),
          actions: [
            PopupMenuButton(
                elevation: 16.0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    bottomLeft: Radius.circular(24.0),
                    bottomRight: Radius.circular(24.0),
                  ),
                ),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: FloatingActionButton(
                          backgroundColor: Theme.of(context).primaryColor,
                          mini: true,
                          child: _playing
                              ? const Icon(
                                  FontAwesomeIcons.stopCircle,
                                  color: Colors.white,
                                )
                              : const Icon(
                                  FontAwesomeIcons.playCircle,
                                  color: Colors.white,
                                ),
                          onPressed: () {
                            setState(() {
                              _playing = !_playing;
                              Navigator.of(context).pop();
                            });
                          }),
                    ),
                    PopupMenuItem(
                      child: FloatingActionButton(
                          backgroundColor: Theme.of(context).primaryColor,
                          mini: true,
                          child: const Icon(
                            Icons.zoom_in,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              fontsize++;
                            });
                          }),
                    ),
                    PopupMenuItem(
                      child: FloatingActionButton(
                          backgroundColor: Theme.of(context).primaryColor,
                          mini: true,
                          child: const Icon(
                            Icons.zoom_out,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              fontsize--;
                            });
                          }),
                    ),
                  ];
                })
          ],
        ),
        body: Stack(
          children: [
            Scrollbar(
              child: StreamBuilder<Set<String>>(
                  stream: getNotes(slideIndex, noteIndex),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }

                    return ListView.builder(
                        itemCount: slideIndex + 1,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              _newTextTospeak = snapshot.data?.elementAt(index);
                              _speak();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: Colors.black54.withOpacity(0.1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  snapshot.data!.elementAt(index),
                                  style: TextStyle(
                                    fontSize: fontsize,
                                    height: 1.25,
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  }),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 16.0,
                ),
                child: FloatingActionButton.extended(
                  elevation: 16.0,
                  backgroundColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      if (nums.entries.elementAt(slideIndex).value.length - 2 ==
                          noteIndex) {
                        if (slideIndex < nums.length - 1) {
                          slideIndex++;
                          noteIndex = 0;
                        } else {
                          Navigator.of(context).pop();
                        }
                      } else {
                        noteIndex++;
                      }
                    });
                  },
                  label: const Text("Next",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  icon: const Icon(
                    FontAwesomeIcons.arrowAltCircleRight,
                    size: 32.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
