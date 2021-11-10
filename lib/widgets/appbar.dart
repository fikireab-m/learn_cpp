import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar(this.appBarTitle, {Key? key}) : super(key: key);
  final String appBarTitle;
  @override
  Widget build(BuildContext context) {
    double appBarWidth = AppBar().preferredSize.height;
    double appBarHeight = AppBar().preferredSize.height;
    return SizedBox(
      height: appBarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: SizedBox(
              width: appBarWidth - 8,
              height: appBarHeight - 8,
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  appBarTitle,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8),
            child: Center(
              child: Text(
                "<${DateFormat("dd-MMM").format(
                  DateTime.now(),
                )}>",
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
