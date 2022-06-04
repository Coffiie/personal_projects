import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_editor_app_material_you_speed_code/chip_widget.dart';

class EditPhotoView extends StatefulWidget {
  const EditPhotoView({Key? key}) : super(key: key);

  @override
  State<EditPhotoView> createState() => _EditPhotoViewState();
}

class _EditPhotoViewState extends State<EditPhotoView> {
  double _sliderValue = 0.34;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: 1,
        destinations: const [
          NavigationDestination(icon: Icon(CupertinoIcons.info), label: ''),
          NavigationDestination(icon: Icon(Icons.image), label: ''),
          NavigationDestination(icon: Icon(CupertinoIcons.crop), label: ''),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          'Adjust',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            CupertinoIcons.xmark,
            size: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.check),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            color: Theme.of(context).backgroundColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.55,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/a_1.jpg'),
                        )),
                  ),
                  Positioned.fill(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Theme.of(context).backgroundColor),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 4),
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Contrast',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Theme.of(context)
                                                .floatingActionButtonTheme
                                                .backgroundColor,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              (_sliderValue * 100)
                                                  .toStringAsFixed(0),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ]),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: ListView(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: const [
                SizedBox(
                  width: 20,
                ),
                ChipWidget(
                    label: Icon(
                      CupertinoIcons.brightness,
                    ),
                    horizontalPadding: 8),
                SizedBox(
                  width: 16,
                ),
                ChipWidget(
                    label: Icon(Icons.water_drop_outlined),
                    horizontalPadding: 8),
                SizedBox(
                  width: 16,
                ),
                ChipWidget(label: Icon(Icons.contrast), horizontalPadding: 8),
                SizedBox(
                  width: 16,
                ),
                ChipWidget(
                    label: Icon(Icons.settings_brightness),
                    horizontalPadding: 8),
                SizedBox(
                  width: 16,
                ),
                ChipWidget(label: Icon(Icons.settings), horizontalPadding: 8),
                SizedBox(
                  width: 16,
                ),
                ChipWidget(
                    label: Icon(CupertinoIcons.brightness),
                    horizontalPadding: 8),
                SizedBox(
                  width: 20,
                ),
              ],
            )),
            Slider(
              value: _sliderValue,
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
            SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }
}
