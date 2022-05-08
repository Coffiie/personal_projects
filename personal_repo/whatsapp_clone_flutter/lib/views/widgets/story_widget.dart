import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/views/widgets/add_button.dart';
import 'package:whatsapp_clone_flutter/views/widgets/photo_widget.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({Key? key, required this.controllerValue})
      : super(key: key);

  final double controllerValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kToolbarHeight + 40),
      child: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.35,
                minHeight: MediaQuery.of(context).size.height * 0.2),
            child: AnimatedContainer(
                height: _getHeight(context),
                duration: const Duration(microseconds: 1),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const AddButton(),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, i) => PhotoWidget(index: i)),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  double _getHeight(BuildContext context) {
    final double mediaSize = MediaQuery.of(context).size.height * 0.08;
    return controllerValue == 0
        ? mediaSize
        : (MediaQuery.of(context).size.height * controllerValue) * 0.8;
  }
}
