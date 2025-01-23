import 'package:flutter/material.dart';
import 'package:upgrade_3_27/app_bar.dart';

enum Calendar { day, week, month }

class SegmentedButtonExample extends StatefulWidget {
  const SegmentedButtonExample({super.key});

  @override
  State<SegmentedButtonExample> createState() => _SegmentedButtonExampleState();
}

class _SegmentedButtonExampleState extends State<SegmentedButtonExample> {
  var animatedChild = SingleChoice(
    key: ValueKey<Axis>(Axis.horizontal),
    axis: Axis.horizontal,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpdateAppBar(),
      body: SingleChildScrollView(
        child: Column(
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
                    GestureDetector(
                      onTap: () {
                        if (animatedChild.key ==
                            ValueKey<Axis>(Axis.vertical)) {
                          setState(() {
                            animatedChild = SingleChoice(
                              axis: Axis.horizontal,
                              key: ValueKey<Axis>(Axis.horizontal),
                            );
                          });
                        } else {
                          setState(() {
                            animatedChild = SingleChoice(
                              axis: Axis.vertical,
                              key: ValueKey<Axis>(Axis.vertical),
                            );
                          });
                        }
                      },
                      child: Text(
                        'Segmented Button',
                        style: Theme.of(context).textTheme.displaySmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    AnimatedSwitcher(
                      transitionBuilder: (child, animation) => ScaleTransition(
                        scale: animation,
                        child: child,
                      ),
                      duration: const Duration(milliseconds: 250),
                      switchInCurve: Curves.easeInOutCubicEmphasized,
                      switchOutCurve: Curves.easeInOutCubicEmphasized,
                      child: animatedChild,
                    )
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

class SingleChoice extends StatefulWidget {
  const SingleChoice({super.key, required this.axis});

  final Axis axis;

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  Calendar calendarView = Calendar.day;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      alignment: Alignment.center,
      child: SegmentedButton<Calendar>(
        style: ButtonStyle(
            shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        )),
        direction: widget.axis,
        segments: const <ButtonSegment<Calendar>>[
          ButtonSegment<Calendar>(
              value: Calendar.day,
              label: Text('Day'),
              icon: Icon(Icons.calendar_view_day)),
          ButtonSegment<Calendar>(
              value: Calendar.week,
              label: Text('Week'),
              icon: Icon(Icons.calendar_view_week)),
          ButtonSegment<Calendar>(
              value: Calendar.month,
              label: Text('Month'),
              icon: Icon(Icons.calendar_view_month)),
        ],
        selected: <Calendar>{calendarView},
        onSelectionChanged: (Set<Calendar> newSelection) {
          setState(() {
            // By default there is only a single segment that can be
            // selected at one time, so its value is always the first
            // item in the selected set.
            calendarView = newSelection.first;
          });
        },
      ),
    );
  }
}
