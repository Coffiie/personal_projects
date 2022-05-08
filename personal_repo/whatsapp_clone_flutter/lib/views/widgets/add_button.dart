import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    Key? key,
  }) : super(key: key);

  final double threshold = 230;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // log('[from AddButton] ${constraints.toString()}');
      double minHeight = constraints.minHeight * 0.4;
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: constraints.minHeight < threshold ? 16 : 4,
            vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: constraints.minHeight < threshold ? minHeight : 160,
              curve: Curves.easeOut,
              width: constraints.minHeight < threshold ? 55 : 115,
              decoration: ShapeDecoration(
                shape: constraints.minHeight < threshold
                    ? CircleBorder(
                        side: BorderSide(color: Colors.grey.withOpacity(0.7)))
                    : RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
              ),
              child: Padding(
                padding: constraints.minHeight < threshold
                    ? const EdgeInsets.all(4.0)
                    : EdgeInsets.zero,
                child: AnimatedCrossFade(
                  sizeCurve: Curves.easeOut,
                  duration: const Duration(milliseconds: 1),
                  crossFadeState: constraints.minHeight < threshold
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  firstChild: const Hero(
                    tag: 'add',
                    child: Center(
                      child: Icon(Icons.add),
                    ),
                  ),
                  secondChild: Stack(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(microseconds: 1),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey.withOpacity(0.7)),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Positioned.fill(
                        top: 30,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Hero(
                            tag: 'add',
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.7))),
                              child: const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Icon(Icons.add),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Positioned.fill(
                        bottom: 30,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            'Create\nYour Story',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            constraints.minHeight < threshold
                ? const SizedBox(height: 8)
                : Container(),
            AnimatedOpacity(
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 200),
              opacity: constraints.minHeight < threshold ? 1 : 0,
              child: const Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      );
    });
  }
}
