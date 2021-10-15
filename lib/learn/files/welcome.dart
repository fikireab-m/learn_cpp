var welcome = {
  "Title": "Welcome",
  "disc":
      "Welcome to My classroom.\n\nOn this course we will learn C++ from scratch, Start learning now\n\n"
};

var whatIs = {
  "Title": "What is C++?",
  "disc":
      "C++ is a general purpose, case-sensitive, free-form programming language that supports object-oriented, procedural and generic programming.C++ is a middle-level language, as it encapsulates both high and low level language features.C++ gives programmers a high level of control over system resources and memory.C++ programming language was developed in 1980 by Bjarne Stroustrup at bell laboratories of AT&T (American Telephone & Telegraph), located in U.S.A. Bjarne Stroustrup is known as the founder of C++ language. It was develop for adding a feature of OOP (Object Oriented Programming) in C without significantly changing the C component."
};

var why = {
  "Title": "Why C++?",
  "disc":
      "C++ is one of the world's most popular programming languages.\nC++ can be found in today's operating systems, Graphical User Interfaces, and embedded systems.\nC++ is portable and can be used to develop applications that can be adapted to multiple platforms.\nAs C++ is close to C# and Java, it makes it easy for programmers to switch to C++ or vice versa.\n\nC++ is fun and easy to learn!"
};

List<Map> lessons = [welcome, whatIs, why];

const example = [
  '''
# Markdown Example
Markdown allows you to easily include formatted text, images, and even formatted
 Dart code in your app.
''',
  '''
## Styling
Style text as _italic_, __bold__, or `inline code`.
- Use bulleted lists
- To better clarify
- Your points

## Links
You can use [hyperlinks](https://flutter.dev) in markdown
''',
  '''
## Images
You can include images:
![Hotel 1](assets/images/hotel_1.png)

## Markdown widget
This is an example of how to create your own Markdown widget:

`new Markdown(data: 'Hello _world_!');`

''',
  '''
## Code blocks
Formatted Dart code looks really pretty too:
```dart
void main() {
  runApp(new MaterialApp(
    home: new Scaffold(
      body: new Markdown(data: markdownData)
    )
  ));
}
```
''',
  '''
## Tables: 

| foo | bar |
| --- | --- |
| baz | bim |

Enjoy!'''
];
var ex = {
  "text": '''Dart code looks good here''',
  "code": '''
```dart
void main() {
  runApp(new MaterialApp(
    home: new Scaffold(
      body: new Markdown(data: markdownData)
    )
  ));
}
```
'''
};
