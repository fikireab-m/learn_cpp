import 'dart:async';

import 'package:flutter_tts/flutter_tts.dart';

import 'files/welcome.dart';

FlutterTts flutterTts = FlutterTts();
String? _newTextTospeak;
Future _speak() async {
  await flutterTts.awaitSynthCompletion(true);
  await flutterTts.awaitSpeakCompletion(true);
  await flutterTts.speak(_newTextTospeak!);
  // .whenComplete(() => flutterTts.stop());
}

Future<bool> _next() async {
  await Future.delayed(const Duration(seconds: 0)).whenComplete(() => _speak());
  return true;
}

class SlideProvider {
  Stream<List<String>> currentSlide() async* {
    for (var i = 0; i < example.length; i++) {
      _newTextTospeak = example.elementAt(i);
      await _next();
      yield example.sublist(0, i + 1);
    }
  }

  StreamController<int> _currentIndex = StreamController<int>();
  Stream<int> get currentIndex => _currentIndex.stream;
  SlideProvider() {
    currentSlide().listen((slides) {
      _currentIndex.add(slides.length);
    });
  }
}
