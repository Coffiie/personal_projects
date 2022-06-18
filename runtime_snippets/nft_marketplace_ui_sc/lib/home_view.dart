import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nft_marketplace_ui_sc/app_colors.dart';
import 'package:nft_marketplace_ui_sc/auction_details.dart';
import 'package:nft_marketplace_ui_sc/auction_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  static const String route = '/homeView';

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {},
        child: const Icon(
          FontAwesomeIcons.plus,
          color: Colors.white,
          size: 25,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Stack(
        children: [
          Positioned.fill(
            bottom: 0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(),
              ),
            ),
          ),
          BottomAppBar(
              notchMargin: 0,
              shape: const CircularNotchedRectangle(),
              child: SizedBox(
                height: h * 0.08,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Icon(FontAwesomeIcons.house),
                                Icon(FontAwesomeIcons.wallet),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: w * 0.2,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Icon(FontAwesomeIcons.heart),
                                Icon(FontAwesomeIcons.user),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
      appBar: AppBar(
        leadingWidth: 0,
        leading: const SizedBox.shrink(),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.bell),
          )
        ],
        title: Text(
          'NFTs',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(FontAwesomeIcons.magnifyingGlass),
                    hintText: 'Collection, item or user',
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.textFieldColor),
                        borderRadius: BorderRadius.circular(8)),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.textFieldColor),
                        borderRadius: BorderRadius.circular(8)),
                    fillColor: AppColors.textFieldColor,
                    filled: true),
              ),
            ),
            SizedBox(
              height: h * 0.05,
            ),
            AuctionItem(
                amount: '2.31',
                description: 'Colored bubbles',
                heading: 'Live auctions',
                imagePath: 'assets/nft2.jpg',
                onTap: () {
                  Navigator.pushNamed(context, AuctionDetails.route);
                },
                uploader: '@Magdiellop'),
            SizedBox(
              height: h * 0.05,
            ),
            AuctionItem(
                amount: '2.31',
                description: 'Colored bubbles',
                heading: 'Hot bids',
                imagePath: 'assets/nft3.jpg',
                onTap: () {},
                uploader: '@Magdiellop')
          ],
        ),
      ),
    );
  }
}
