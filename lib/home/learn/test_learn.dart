import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;

class TestLearn extends StatelessWidget {
  const TestLearn({Key? key}) : super(key: key);

  final String sample = '''# What's C++?
C++ is a cross-platform language that can be used to create high-performance applications.
It was developed by Bjarne Stroustrup at Bell labs in 1979, as an OOP extension to the C language.
C++ gives programmers a high level of control over system resources and memory.
The language was updated 3 major times in 2011, 2014, and 2017 to C++11, C++14, and C++17.
 
# Why you learn C++?
* C++ is one of the world's most popular programming languages.
* C++ is portable and can be used to develop applications, and video games that can be adapted to multiple platforms.
> Hey, C++ is fun and easy to learn.
> So, let's go learn some codding.

# Get Started
To start using C++, you need two things:

* A text editor, like Notepad, to write C++ code
* Acompiler, like GCC, to translate the C++ code into a language that the computer will understand

There are many text editors and compilers to choose from. In this tutorial, we will use an IDE (Integrated Development Environment) called **Code::Blocks**, which we believe is a good place to start.
> You can also use web-based IDEs, but thier functionality may be limited.

👉 Watch how to install and configure Code::Blocks IDE on [Watch our video tutorial](http://www.codeblocks.org/downloads/26).

Hello World
Now, we are all set to write our first C++ program
- [x] Open Codeblocks and create an _empty file_.
- [x] Write the following code and save the file as _hello.cpp_.

``` c++
#include <iostream>
using namespace std;

int main() {
  cout << "Hello World!";
  return 0;
}
```
Then, go to **Build > Build and Run** to run (execute) the program. Your output should look like:
```
Hello World!
Process returned 0 (0x0) execution time : 0.011 s
Press any key to continue.
```
> 👍 **Congratulations!** You have now written and executed your first C++ program.<br>
👉 [Watch our video tutorial](http://www.codeblocks.org/downloads/26) for more detail.

# Syntax of C++
Syntax is like a grammer in a natural language. C++ has its own grammer, and we have to apply it properly to communicate with Mr. Compiler. If your c++ programm has syntax error, the c++ compiler will not understand what you want to tell it, and it will throw an error.

Let's break our hello world program to understand it more.
```c++
#include <iostream>
using namespace std;

int main() {
  cout << "Hello World!";
  return 0;
}
```
Let's see it line by line <br>
`#include <iostream>`: Adding the header file library that lets us work with input and output objects, such as cout (used in line 5).<br>
`using namespace std;`: It means that we can use names for objects and variables from the standard library.<br>
`int main()`: Another thing that always appear in a C++ program is the **main** funtion. Any code inside its curly brackets {} will be executed.<br>
`cout << "Hello World!";`: cout (pronounced "see-out") is an object used to output/print text.<br>
`return 0;` ends the main function.
> C++ ignores white space.<br>
> Every C++ statement ends with a semicolon **;**.<br>
> The compiler ignores white spaces. However, multiple lines makes the code more readable.

# C++ Output
In our first program, we have seen how to print out a text to console by using `cout` object.<br>
Note: `cout` doesn't insert a new line after an output. To get new line we can use **endl** or **"\n"**. <br>
Alright, let's see it on our *hello* program.
```c++
#include <iostream>
using namespace std;
int main() {

    cout << "Hello There" << endl;
    cout << "I am learning C++"<<"\n"
    << "C++ is so cool.";

    return 0;
} 
```
The output should look like
```
    Hello There
    I am learning C++
    C++ is so cool.
```
See? We got new lines there.
> [Watch our video tutorial](youtube.com) 

# C++ Comments
Comments can be used to explain C++ code, and to make it more readable. It can also be used to prevent execution when testing alternative code. Comments can be **singled-lined** or **multi-lined**.<br>
Single-line comments start with two forward slashes **//**.<br>
The first line in the following code snippet is a single line comment.
```c++
//Printing hello world using cout
cout<<"hello word";
```
Multi-line comments start with __/*__ and ends with __*/__.
Any text between /* and */ will be ignored by the compiler.
```c++
/* The code below will print Hello World!
to the screen, and it is amazing */
cout << "Hello World!";
```
For all of that and more
> [Watch our video tutorial](youtube.com)

# C++ Variables
Variables are containers for storing data values.
## Declaring Variables
Declaring is creating a new varible. There there are some constraints to follow while we create variables.
* we have to tell what type of data the variable should hold
* We have to give name to our varible, all C++ variables must be identified with unique names.
### General rules for constructing names for variables
- Names can contain letters, digits and underscores
- Names must begin with a letter or an underscore ( _ )
- Names are case sensitive (myVar and myvar are different variables)
- Names cannot contain whitespaces or special characters like !, #, %, etc
- Reserved words (like C++ keywords, such as int) cannot be used as names

```c++
int main(){
    int x = 5;
    int y; 
    y = 6;
    int sum = x + y;
    cout << sum;    //Output will be 11
    return 0;
}
```
Here **x**,**y** and **sum** are variables.<br>
If we take a look at varible **x**, `int` defines the type of data the variable holds, `x` is the name(identifier) of the variable and `=5` initializes **x** with a value 5.<br>
We can declare and initialize variables separately like we did for varible **y**.
> Varible names are also called identifiers.<br>
> Initilizing is storing data on the variable.(not updating)<br>
> It is recommended to use descriptive names in order to create understandable and maintainable code.
 ''';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: Markdown(
          data: sample,
          physics: const BouncingScrollPhysics(),
          extensionSet: md.ExtensionSet(
            md.ExtensionSet.gitHubFlavored.blockSyntaxes,
            md.ExtensionSet.gitHubFlavored.inlineSyntaxes,
          ),
        ),
      ),
    );
  }
}
