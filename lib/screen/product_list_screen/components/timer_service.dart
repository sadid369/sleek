import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class TimerBasic extends StatelessWidget {
  final CountDownTimerFormat format;
  final bool inverted;

  const TimerBasic({
    required this.format,
    this.inverted = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TimerCountdown(
      format: format,
      endTime: DateTime.now().add(
        const Duration(
          days: 3,
          hours: 20,
          minutes: 47,
          seconds: 45,
        ),
      ),
      onEnd: () {
        print("Timer finished");
      },
      timeTextStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w300,
        fontSize: 40,
        fontFeatures: <FontFeature>[
          FontFeature.tabularFigures(),
        ],
      ),
      colonsTextStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w300,
        fontSize: 40,
        fontFeatures: <FontFeature>[
          FontFeature.tabularFigures(),
        ],
      ),
      descriptionTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontFeatures: <FontFeature>[
          FontFeature.tabularFigures(),
        ],
      ),
      spacerWidth: 20,
      daysDescription: "Days",
      hoursDescription: "Hours",
      minutesDescription: "Minutes",
      secondsDescription: "Seconds",
    );
  }
}

const Color purple = Color.fromARGB(255, 63, 45, 149);

class TimerFrame extends StatelessWidget {
  final String description;
  final Widget timer;
  final bool inverted;

  const TimerFrame({
    required this.description,
    required this.timer,
    this.inverted = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      child: Column(
        children: [
          Text(
            description,
            style: const TextStyle(
              fontSize: 20,
              letterSpacing: 0,
              color: Colors.black,
            ),
          ),
          timer,
        ],
      ),
    );
  }
}
