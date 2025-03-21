import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //state variable to open and close drawer
  var menuIsOpen = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var isMobile = width < 500;

    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ColoredBox(
              color: Colors.black87,
              child: AnimatedSize(
                curve: Curves.fastOutSlowIn,
                duration: Durations.long4,
                //depend on variable
                child: SizedBox(
                  width:
                      menuIsOpen
                          ? isMobile
                              ? 150
                              : 200
                          : 0,
                ),
              ),
            ),
            Expanded(
              child: ColoredBox(
                color: Colors.black54,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        //toggle drawer
                        setState(() {
                          menuIsOpen = !menuIsOpen;
                        });
                      },
                      icon: Icon(Icons.menu),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
