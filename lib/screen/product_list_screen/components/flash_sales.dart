import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:gap/gap.dart';
import 'package:sleek/screen/product_list_screen/components/timer_service.dart';

import '../../../utility/app_color.dart';

class FlashSales extends StatelessWidget {
  const FlashSales({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 10,
              height: 20,
              decoration: const BoxDecoration(
                color: AppColor.darkOrange,
              ),
            ),
            const Gap(15),
            const Text(
              'Today’s',
              style: TextStyle(
                color: AppColor.darkOrange,
              ),
            )
          ],
        ),
        const Gap(15),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Flash Sales',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            TimerFrame(
              description: '',
              timer: TimerBasic(
                format: CountDownTimerFormat.daysHoursMinutesSeconds,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
