import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft_marketplace_ui_sc/app_colors.dart';
import 'package:nft_marketplace_ui_sc/auction_details.dart';
import 'package:nft_marketplace_ui_sc/home_view.dart';
import 'package:nft_marketplace_ui_sc/landing_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeView.route: (context) => const HomeView(),
        AuctionDetails.route: (context) => const AuctionDetails()
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          bottomAppBarTheme:
              BottomAppBarTheme(color: Colors.white.withOpacity(0.3)),
          iconTheme: const IconThemeData(color: AppColors.white),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            sizeConstraints: BoxConstraints(
              minHeight: 80,
              minWidth: 80,
            ),
            backgroundColor: AppColors.primaryColor,
          ),
          textTheme: TextTheme(
              headline4: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.chakraPetch().fontFamily),
              headline2: const TextStyle(color: AppColors.white)),
          scaffoldBackgroundColor: AppColors.scaffoldBackground,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  primary: AppColors.primaryColor,
                  minimumSize: const Size(50, 55)))),
      home: const LandingView(),
    );
  }
}
