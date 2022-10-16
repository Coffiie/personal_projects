import 'package:flutter/material.dart';
import 'package:instagram_redesign_sc_app/providers/app_provider.dart';
import 'package:instagram_redesign_sc_app/theme/app_colors.dart';
import 'package:instagram_redesign_sc_app/views/home/parent_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppProvider(),
      child: Consumer<AppProvider>(builder: (context, appProvider, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
              backgroundColor: AppColors.lightContainerBackground,
              scaffoldBackgroundColor: AppColors.white,
              brightness: Brightness.light,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: AppColors.white,
                selectedIconTheme: IconThemeData(color: Colors.black),
                unselectedIconTheme:
                    IconThemeData(color: AppColors.greyIconColor),
              ),
              dividerColor: AppColors.greyIconColor,
              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.profileButtonColorLight,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)))),
              textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(foregroundColor: Colors.black)),
              appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: AppColors.greyIconColor),
                  shadowColor: Colors.transparent,
                  backgroundColor: Colors.transparent)),
          home: const ParentView(),
          themeMode: appProvider.mode,
          darkTheme: ThemeData(
              primaryColor: Colors.blue,
              brightness: Brightness.dark,
              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.profileButtonColorLight,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)))),
              backgroundColor: Colors.black,
              scaffoldBackgroundColor: Colors.black,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  backgroundColor: Colors.black,
                  selectedIconTheme: IconThemeData(color: Colors.white),
                  unselectedIconTheme:
                      IconThemeData(color: AppColors.greyIconColor)),
              appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(
                    color: AppColors.greyIconColor,
                  ),
                  shadowColor: Colors.transparent,
                  backgroundColor: Colors.transparent)),
        );
      }),
    );
  }
}
