import 'package:flutter/material.dart';

import 'Colors.dart';

ThemeData lightTheme() => ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: AppColor.primaryColor,
      disabledColor: Colors.grey[200],
      inputDecorationTheme: const InputDecorationTheme(),
      colorScheme: ColorScheme(
        onSecondary: Colors.white,
        primaryContainer: Colors.white,
        brightness: Brightness.dark,
        primary: AppColor.primaryColor,
        onPrimary: AppColor.primaryColor,
        secondary: Colors.green[900]!,
        error: Colors.red,
        onError: Colors.red,
        background: Colors.grey[200]!,
        onBackground: Colors.grey[200]!,
        surface: Colors.white,
        onSurface: AppColor.txtDarkColor,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 1,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        surfaceTintColor: Colors.white,
        titleTextStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 15,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        scrolledUnderElevation: 0,
      ),
      buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        splashColor: Colors.grey,
        highlightColor: Colors.grey,
        buttonColor: Colors.transparent,
      ),
      listTileTheme: ListTileThemeData(
        textColor: Colors.black,
        iconColor: AppColor.primaryColor,
      ),
      dialogTheme: const DialogTheme(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        elevation: 0,
      ),
      cardTheme: const CardTheme(
        surfaceTintColor: Colors.white,
      ),
      useMaterial3: true,
      bottomSheetTheme: const BottomSheetThemeData(
        modalBackgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        showDragHandle: false,
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        menuStyle: MenuStyle(
          surfaceTintColor: MaterialStateProperty.all(Colors.transparent),
        ),
      ),
      fontFamily: 'Montserrat',
      tabBarTheme: TabBarTheme(
        labelColor: Colors.black,
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        labelStyle: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        labelPadding: const EdgeInsets.only(),
        unselectedLabelStyle: const TextStyle(
          fontSize: 15,
          fontFamily: 'Montserrat',
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelColor: Colors.black,
        indicatorColor: AppColor.primaryColor,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColor.primaryColor,
      ),
      textTheme: const TextTheme(
        labelSmall: TextStyle(
          fontSize: 13, // font size (13),
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          fontSize: 36, // font size (36),
          color: Colors.black,
        ),
        headlineMedium: TextStyle(
          fontSize: 25, // font size (25),
          color: Colors.black,
        ),
        headlineSmall: TextStyle(
          fontSize: 22, // font size (22),
          color: Colors.black,
        ),
        titleLarge: TextStyle(
          fontSize: 20, // font size (20),
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          fontSize: 18, // font size (18),
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          fontSize: 11, // font size (11),
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          fontSize: 15, // font size (15), -- use default font
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          fontSize: 14, // font size (14),-- use default font
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        bodyLarge: TextStyle(
          fontSize: 16, // font size (16),-- use default font
          color: Colors.black,
        ),
        displaySmall: TextStyle(
          fontSize: 12, // font size (12),
          color: Colors.black,
        ),
        displayMedium: TextStyle(
          fontSize: 17, // font size (17),
          color: Colors.black,
        ),
        displayLarge: TextStyle(
          fontSize: 20, // font size (20),
          color: Colors.black,
        ),
      ),
      hintColor: Colors.grey,
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconColor: MaterialStateProperty.all(
            Colors.black,
          ),
        ),
      ),
    );
// final darkTheme = ThemeData(
//   scaffoldBackgroundColor: Colors.grey[900],
//   useMaterial3: true,
//   primarySwatch: Colors.red,
//   brightness: Brightness.dark,
//   colorScheme: ColorScheme(
//     onSecondary: Colors.white,
//     primaryContainer: Colors.white,
//     brightness: Brightness.dark,
//     primary: primaryColorRed,
//     onPrimary: primaryColorRed,
//     secondary: Colors.green[900]!,
//     error: Colors.red,
//     onError: Colors.red,
//     background: Colors.grey[200]!,
//     onBackground: Colors.grey[200]!,
//     surface: Colors.white,
//     onSurface: Colors.white,
//   ),
//   appBarTheme: AppBarTheme(
//     elevation: 0,
//     backgroundColor: Colors.grey[900],
//     centerTitle: true,
//     titleTextStyle: appBarTextStyle(
//       fontSized: responsiveFont(
//         medium(),
//       ),
//     ),
//     actionsIconTheme: const IconThemeData(
//       color: Colors.black,
//       opticalSize: 10,
//     ),
//     scrolledUnderElevation: 0,
//   ),
//   textTheme: TextTheme(
//     displayMedium: TextStyle(
//       fontSize: responsiveFont(normalFont()),
//       color: Colors.black,
//     ),
//   ),
//   iconTheme: IconThemeData(
//     color: Colors.white,
//   ),
// );
