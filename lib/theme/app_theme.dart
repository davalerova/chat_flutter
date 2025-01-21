import 'package:flutter/material.dart';

const colorList = <Color>[
  Color(0xFF3B76EB),
  Colors.red,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.purple,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({
    this.selectedColor = 0,
    this.isDarkMode = false,
  })  : assert(selectedColor >= 0, 'selectedColor must be greater than 0'),
        assert(selectedColor < colorList.length,
            'selectedColor must be less than ${colorList.length}');

  ThemeData getTheme() => ThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: AppBarTheme(centerTitle: false),
      );

  AppTheme copyWith({bool? isDarkMode, int? selectedColor}) {
    return AppTheme(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      selectedColor: selectedColor ?? this.selectedColor,
    );
  }
}
