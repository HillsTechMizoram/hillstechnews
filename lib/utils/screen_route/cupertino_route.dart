import 'package:flutter/cupertino.dart';

cupertinoPageRoute(BuildContext context, Widget screen) {
  Navigator.of(context).push(CupertinoPageRoute(builder: (context) => screen));
}
