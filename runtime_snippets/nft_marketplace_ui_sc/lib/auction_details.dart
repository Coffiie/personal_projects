import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft_marketplace_ui_sc/app_colors.dart';

class AuctionDetails extends StatelessWidget {
  const AuctionDetails({Key? key}) : super(key: key);

  static const String route = '/AuctionDetails';

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.heart),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.share),
          )
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            children: [
              Container(
                height: h * 0.6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/nft3.jpg'))),
              ),
              Positioned.fill(
                  top: 16,
                  left: 16,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).bottomAppBarTheme.color,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            '11h : 21m : 57s',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )),
                  ))
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Crystal',
                style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontFamily: GoogleFonts.chakraPetch().fontFamily,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  const Icon(
                    FontAwesomeIcons.ethereum,
                    color: AppColors.primaryColor,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '1.73 ETH',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '@Bastion',
            style: TextStyle(color: Colors.grey.shade400),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Crystal is a collection of 1,000 unique Crystal NFTs by Bastion -- rare digital collectibles living on the Ethereum blockchain.',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.grey.shade400),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(minimumSize: const Size(0, 55)),
                  onPressed: () {},
                  child: Text(
                    'Buy now',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 32,
        )
      ]),
    );
  }
}
