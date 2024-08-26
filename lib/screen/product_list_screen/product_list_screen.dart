import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:gap/gap.dart';
import 'package:sleek/screen/product_list_screen/components/flash_sales.dart';
import 'package:sleek/screen/product_list_screen/components/timer_service.dart';
import 'package:sleek/utility/app_color.dart';
import 'package:sleek/widget/product_list_view.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../core/data/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../widget/product_grid_view.dart';
import 'components/category_selector.dart';
import 'components/custom_app_bar.dart';
import 'components/poster_section.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   "Hello Sina",
                //   style: Theme.of(context).textTheme.displayLarge,
                // ),
                // Text(
                //   "Lets gets somethings?",
                //   style: Theme.of(context).textTheme.headlineSmall,
                // ),
                const PosterSection(),
                const Gap(100),
                const FlashSales(),
                const Gap(30),
                const SizedBox(height: 5),
                Consumer<DataProvider>(
                  builder: (context, dataProvider, child) {
                    return ProductListView(
                      items: dataProvider.products,
                    );
                  },
                ),
                Consumer<DataProvider>(
                  builder: (context, dataProvider, child) {
                    return CategorySelector(
                      categories: dataProvider.categories,
                    );
                  },
                ),
                Consumer<DataProvider>(
                  builder: (context, dataProvider, child) {
                    return ProductGridView(
                      items: dataProvider.products,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
