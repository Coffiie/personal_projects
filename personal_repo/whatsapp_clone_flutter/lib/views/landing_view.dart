import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/views/widgets/custom_app_bar.dart';
import 'package:whatsapp_clone_flutter/views/widgets/custom_bottom_sheet.dart';
import 'package:whatsapp_clone_flutter/views/widgets/gradient_background.dart';
import 'package:whatsapp_clone_flutter/views/widgets/story_widget.dart';

class LandingView extends StatefulWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(microseconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          const GradientBackground(),
          const CustomAppBar(),
          StoryWidget(controllerValue: controller.value),
          CustomBottomSheet(
            onVerticalDragUpdate: (details) {
              double height = MediaQuery.of(context).size.height;
              double animationValue = details.globalPosition.dy / height;
              setState(() {
                controller.value = animationValue;
              });
            },
            controllerValue: controller.value,
          )
        ],
      ),
    );
  }
}
