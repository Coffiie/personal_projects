import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:notes_app_ui_speed_code/app_colors.dart';
import 'package:notes_app_ui_speed_code/views/curved_box.dart';

class FolderView extends StatelessWidget {
  const FolderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          FontAwesomeIcons.plus,
          color: AppColors.white,
        ),
      ),
      body: MasonryGridView.count(
          padding: const EdgeInsets.all(16),
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          itemCount: 5,
          itemBuilder: (context, index) => CurvedBox(children: [
                Lottie.asset('assets/folder.json', repeat: false),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    index == 0
                        ? Text(
                            'ToDo',
                            style: Theme.of(context).textTheme.titleLarge,
                          )
                        : index == 1
                            ? Text(
                                'Freelancer',
                                style: Theme.of(context).textTheme.titleLarge,
                              )
                            : index == 2
                                ? Text(
                                    'Daily Life',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  )
                                : index == 3
                                    ? Text(
                                        'My Targets',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      )
                                    : index == 4
                                        ? Text(
                                            'Quotes',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge,
                                          )
                                        : const SizedBox.shrink()
                  ],
                )
              ])),
    );
  }
}
