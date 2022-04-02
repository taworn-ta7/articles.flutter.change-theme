import 'package:flutter/material.dart';
import 'main.dart';

/// Common singleton class.
class Common {
  static Common? _instance;

  static Common instance() {
    _instance ??= Common();
    return _instance!;
  }

  Common();

  // ----------------------------------------------------------------------

  //
  // Theme
  //

  /// Material color list.
  static List<MaterialColor> themeList = [
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.red,
    Colors.purple,
    Colors.indigo,
    Colors.brown,
    Colors.grey,
  ];

  /// Current theme.
  MaterialColor get currentTheme => themeList[_indexTheme];
  int _indexTheme = 0;

  /// Change current theme.
  void changeTheme(BuildContext context, int index) {
    if (index < 0 || index >= themeList.length) return;

    if (_indexTheme != index) {
      _indexTheme = index;
      App.refresh(context);
    }
  }
}
