import 'package:flutter/material.dart';

import 'dimens.dart';

var lighttheme = ThemeData();

class AppColors {
  //colors
  static const tangBlue = Color(0xff1559C9);
  static const darkGrey = Color(0xff535353);

  //
  static final Color shimmerHighlight = Colors.grey.withOpacity(0.3);
  static const Color shimmerChild = Colors.grey;

  static const Map<int, Color> color = {
    50: Color.fromRGBO(21, 89, 201, .1),
    100: Color.fromRGBO(21, 89, 201, .2),
    200: Color.fromRGBO(21, 89, 201, .3),
    300: Color.fromRGBO(21, 89, 201, .4),
    400: Color.fromRGBO(21, 89, 201, .5),
    500: Color.fromRGBO(21, 89, 201, .6),
    600: Color.fromRGBO(21, 89, 201, .7),
    700: Color.fromRGBO(21, 89, 201, .8),
    800: Color.fromRGBO(21, 89, 201, .9),
    900: Color.fromRGBO(21, 89, 201, 1),
  };

  //shadows
  static BoxShadow backShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    blurRadius: 0.2,
    spreadRadius: 0.2,
  );

  //light colors
  static const backgroundLight = Color(0xFFf7f7f7);
  static const textfieldBackLight = Color(0xffe9ecf8);
  //dark colors
  static const backgroundDark = Color(0xFF1d1d1d);
  static const darkSurface = Color(0xFF2c2f37);
  static const textfieldBackDark = Color(0xFF3b3f48);

  static Color blackWhite = Colors.white;

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: false,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: backgroundLight,
    fontFamily: 'Roboto',
    unselectedWidgetColor: Colors.black54,
    cardColor: Colors.white,
    colorScheme: const ColorScheme.light(
      onPrimary: Colors.black,
      secondary: Colors.black,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 5,
      backgroundColor: backgroundLight,
      centerTitle: false,
      titleSpacing: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.sBorder),
        ),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: textfieldBackLight,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: backgroundDark,
    dividerTheme: const DividerThemeData(
      thickness: 1.3,
      color: textfieldBackDark,
    ),
    fontFamily: 'Roboto',
    colorScheme: const ColorScheme.dark().copyWith(
      brightness: Brightness.dark,
      primary: Colors.white,
      secondary: Colors.white,
      background: backgroundDark,
      surface: darkSurface,
      surfaceTint: textfieldBackDark,
    ),
    cardColor: darkSurface,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 3,
      backgroundColor: backgroundDark,
      surfaceTintColor: backgroundDark,
      centerTitle: false,
      titleSpacing: 0,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.sBorder),
      ),
      backgroundColor: Colors.white,
      foregroundColor: backgroundDark,
    )),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: textfieldBackDark,
    ),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: darkSurface),
  );
}


// static changeTheme({required ThemeMode themeMode}) {
//     // print(headline1);
//     if (themeMode == ThemeMode.light) {
//       textColor = textBlue;
//       blackWhite = Colors.black;
//     } else {
//       textColor = Colors.white;
//       blackWhite = Colors.white;
//     }
//     headline1 = TextStyle(
//       fontSize: 26,
//       fontWeight: FontWeight.w500,
//       color: textColor,
//     );
//     headline2 = TextStyle(
//       fontSize: 18,
//       fontWeight: FontWeight.w500,
//       color: textColor,
//     );
//     headline3 = TextStyle(
//       fontSize: 16,
//       fontWeight: FontWeight.w500,
//       color: themeMode == ThemeMode.light ? AppColors.primary : Colors.white,
//     );

//     headline4 = TextStyle(
//       fontSize: 15,
//       fontWeight: FontWeight.w400,
//       color: textColor,
//     );
//   }