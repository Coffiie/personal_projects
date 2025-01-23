import 'package:flutter/material.dart';
import 'package:upgrade_3_27/app_bar.dart';

enum TransitionType {
  slide,
  scale,
  fade,
}

class CustomPageRoute<T> extends PageRoute<T> {
  CustomPageRoute({
    required this.builder,
    this.transitionType = TransitionType.slide,
  });

  final WidgetBuilder builder;
  final TransitionType transitionType;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  //Each route specifies how it wants to animate in via buildTransitions
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    switch (transitionType) {
      case TransitionType.slide:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      case TransitionType.scale:
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      case TransitionType.fade:
        return FadeTransition(
          opacity: animation,
          child: child,
        );
    }
  }

  Widget _delegatedTransitionBuilder(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      bool allowSnapshotting,
      Widget? child) {
    switch (transitionType) {
      case TransitionType.scale:
        // Make previous route slide out to the left as new route slides in from right
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset.zero,
            end: const Offset(-1.0, 0.0),
          ).animate(secondaryAnimation),
          child: child,
        );
      case TransitionType.slide:
        // Make previous route scale down as new route scales up
        return ScaleTransition(
          scale: Tween<double>(
            begin: 1.0,
            end: 0.8,
          ).animate(secondaryAnimation),
          child: child,
        );
      case TransitionType.fade:
        // Fade out previous route as new route fades in
        return FadeTransition(
          opacity: Tween<double>(
            begin: 1.0,
            end: 0.0,
          ).animate(secondaryAnimation),
          child: child,
        );
    }
  }

  // Here's where we define how the previous route should exit
  // @override
  @override
  DelegatedTransitionBuilder? get delegatedTransition =>
      _delegatedTransitionBuilder;

  @override
  Color? get barrierColor => const Color(0x00000000);

  @override
  bool get barrierDismissible => false;

  @override
  String? get barrierLabel => 'Should be no visible barrier...';

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 1000);
}

class MixingRoutesExample extends StatelessWidget {
  const MixingRoutesExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpdateAppBar(),
      body: Column(
        spacing: 50,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox.shrink(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                spacing: 20,
                children: [
                  Text(
                    'Mixing Routes',
                    style: Theme.of(context).textTheme.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        CustomPageRoute(
                          transitionType: TransitionType.slide,
                          builder: (context) => PageOne(),
                        ),
                      );
                    },
                    child: Text(
                      'Slide Route',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        CustomPageRoute(
                          transitionType: TransitionType.scale,
                          builder: (context) => PageOne(),
                        ),
                      );
                    },
                    child: Text(
                      'Scale Route',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        CustomPageRoute(
                          transitionType: TransitionType.fade,
                          builder: (context) => PageOne(),
                        ),
                      );
                    },
                    child: Text(
                      'Fade Route',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpdateAppBar(),
      body: Column(
        spacing: 50,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox.shrink(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                spacing: 20,
                children: [
                  Text(
                    'Mixing Routes Page 1',
                    style: Theme.of(context).textTheme.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
