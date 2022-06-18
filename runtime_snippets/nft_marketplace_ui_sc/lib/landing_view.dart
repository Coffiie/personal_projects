import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft_marketplace_ui_sc/app_colors.dart';
import 'package:nft_marketplace_ui_sc/home_view.dart';

class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: h * 0.55,
                width: w,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/nft1.jpg'))),
              ),
              Container(
                height: (h * 0.55) + 3,
                width: w,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [
                      0.7,
                      0.95
                    ],
                        colors: [
                      Colors.transparent,
                      Theme.of(context).scaffoldBackgroundColor
                    ])),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Text(
              'Create your own NFT drame gallery',
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    fontFamily: GoogleFonts.chakraPetch().fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const Spacer(),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 50),
            child: Row(
              children: [
                Expanded(
                    flex: 4,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, HomeView.route);
                      },
                      child: Text(
                        'Sign in',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    )),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.socialMediaColor),
                  onPressed: () {
                    Navigator.pushNamed(context, HomeView.route);
                  },
                  child: const Icon(FontAwesomeIcons.apple),
                )),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.socialMediaColor),
                  onPressed: () {
                    Navigator.pushNamed(context, HomeView.route);
                  },
                  child: const Icon(FontAwesomeIcons.google),
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
