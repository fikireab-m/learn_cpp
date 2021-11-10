import 'package:flutter/material.dart';
import 'package:learn_cpp/navigation/navigation_home_screen.dart';

class FoldableOptions extends StatefulWidget {
  const FoldableOptions({Key? key}) : super(key: key);

  @override
  _FoldableOptionsState createState() => _FoldableOptionsState();
}

class _FoldableOptionsState extends State<FoldableOptions>
    with SingleTickerProviderStateMixin {
  final List<IconData> options = [
    Icons.settings,
    Icons.person,
    Icons.favorite,
    Icons.home,
    Icons.star,
  ];

  late Animation<Alignment> firstAnim;
  late Animation<Alignment> secondAnim;
  late Animation<Alignment> thirdAnim;
  late Animation<Alignment> fourthAnim;
  late Animation<Alignment> fifthAnim;
  late Animation<double> verticalPadding;
  late AnimationController controller;
  final duration = const Duration(milliseconds: 200);

  Widget getItem(IconData source) {
    const size = 45.0;
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: Color(0XFFE95A8B),
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: Icon(
        source,
        color: Colors.white.withOpacity(1.0),
        size: 20,
      ),
    );
  }

  Widget buildPrimaryItem(IconData source) {
    const size = 45.0;
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      child: Icon(
        source,
        size: 20,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: duration);

    final anim = CurvedAnimation(parent: controller, curve: Curves.linear);
    firstAnim =
        Tween<Alignment>(begin: Alignment.centerRight, end: Alignment.topRight)
            .animate(anim);
    secondAnim =
        Tween<Alignment>(begin: Alignment.centerRight, end: Alignment.topLeft)
            .animate(anim);
    thirdAnim = Tween<Alignment>(
            begin: Alignment.centerRight, end: Alignment.centerLeft)
        .animate(anim);
    fourthAnim = Tween<Alignment>(
            begin: Alignment.centerRight, end: Alignment.bottomLeft)
        .animate(anim);
    fifthAnim = Tween<Alignment>(
            begin: Alignment.centerRight, end: Alignment.bottomRight)
        .animate(anim);
    verticalPadding = Tween<double>(begin: 0, end: 26).animate(anim);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 210,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 140,
              height: 210,
              margin: const EdgeInsets.only(right: 15, top: 15),
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return Stack(
                    children: <Widget>[
                      Align(
                        alignment: firstAnim.value,
                        child: GestureDetector(
                          onTap: () {
                            controller.reverse();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const NavigationHomeScreen()));
                          },
                          child: getItem(
                            options.elementAt(0),
                          ),
                        ),
                      ),
                      Align(
                        alignment: secondAnim.value,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 37, top: verticalPadding.value),
                          child: GestureDetector(
                            onTap: () {
                              controller.reverse();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const NavigationHomeScreen()));
                            },
                            child: getItem(
                              options.elementAt(1),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: thirdAnim.value,
                        child: GestureDetector(
                          onTap: () {
                            controller.reverse();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const NavigationHomeScreen()));
                          },
                          child: getItem(
                            options.elementAt(2),
                          ),
                        ),
                      ),
                      Align(
                        alignment: fourthAnim.value,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 38, bottom: verticalPadding.value),
                          child: GestureDetector(
                            onTap: () {
                              controller.reverse();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const NavigationHomeScreen()));
                            },
                            child: getItem(
                              options.elementAt(3),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: fifthAnim.value,
                        child: GestureDetector(
                          onTap: () {
                            controller.reverse();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const NavigationHomeScreen()));
                          },
                          child: getItem(
                            options.elementAt(4),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            controller.isCompleted
                                ? controller.reverse()
                                : controller.forward();
                          },
                          child: buildPrimaryItem(
                            controller.isCompleted || controller.isAnimating
                                ? Icons.close
                                : Icons.add,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
