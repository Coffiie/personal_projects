import 'package:flutter/material.dart';
import 'package:upgrade_3_27/app_bar.dart';

class CarouselViewExample extends StatelessWidget {
  const CarouselViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpdateAppBar(),
      body: SingleChildScrollView(
        child: Column(
          spacing: 50,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox.shrink(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  spacing: 20,
                  children: [
                    Text(
                      'Carousel View',
                      style: Theme.of(context).textTheme.displaySmall,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '2,5,2',
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.3,
                      width: MediaQuery.sizeOf(context).width,
                      child: CarouselView.weighted(
                        scrollDirection: Axis.horizontal,
                        flexWeights: [2, 5, 2],
                        itemSnapping: true,
                        children: List<Widget>.generate(10, (int index) {
                          return Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    NetworkImage("https://picsum.photos/200"),
                              ),
                            ),
                            padding: EdgeInsets.all(16),
                          );
                        }),
                      ),
                    ),
                    Text(
                      '3,3,3,2,1',
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.2,
                      width: MediaQuery.sizeOf(context).width,
                      child: CarouselView.weighted(
                        scrollDirection: Axis.horizontal,
                        flexWeights: [3, 3, 3, 2, 1],
                        itemSnapping: true,
                        children: List<Widget>.generate(10, (int index) {
                          return Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    NetworkImage("https://picsum.photos/200"),
                              ),
                            ),
                            padding: EdgeInsets.all(16),
                          );
                        }),
                      ),
                    ),
                    Text(
                      '2,3,4,3,2',
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.05,
                      width: MediaQuery.sizeOf(context).width,
                      child: CarouselView.weighted(
                        scrollDirection: Axis.horizontal,
                        flexWeights: [2, 3, 4, 3, 2],
                        itemSnapping: true,
                        children: List<Widget>.generate(10, (int index) {
                          return Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    NetworkImage("https://picsum.photos/200"),
                              ),
                            ),
                            padding: EdgeInsets.all(16),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
