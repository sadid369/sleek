import 'package:flutter/foundation.dart';
import 'package:sleek/screen/product_list_screen/components/category_selector.dart';

import '../../../core/data/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../utility/app_data.dart';
import '../../../utility/animation/open_container_wrapper.dart';
import '../../../utility/constants.dart';
import '../../product_by_category_screen/product_by_category_screen.dart';

class PosterSection extends StatelessWidget {
  const PosterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Consumer<DataProvider>(
        builder: (context, dataProvider, child) {
          return Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Consumer<DataProvider>(
                      builder: (context, dataProvider, child) {
                        return SizedBox(
                          height: 250,
                          child: ListView.builder(
                            // scrollDirection: Axis.horizontal,
                            itemCount: dataProvider.categories.length,
                            itemBuilder: (context, index) {
                              final category = dataProvider.categories[index];
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 8),
                                child: OpenContainerWrapper(
                                  nextScreen: ProductByCategoryScreen(
                                    selectedCategory:
                                        dataProvider.categories[index],
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('${category.name}'),
                                        const Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          size: 13,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: dataProvider.posters.length,
                  itemBuilder: (_, index) {
                    String? url = dataProvider.posters[index].imageUrl;
                    String imageUrl = url!.replaceAll(LOCALHOST, IP);
                    return Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 880,
                      decoration: BoxDecoration(
                        // color: AppData.randomPosterBgColors[index],
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${dataProvider.posters[index].posterName}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(color: Colors.white),
                                ),
                                const SizedBox(height: 8),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    elevation: 0,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  child: const Text(
                                    "Get Now",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                )
                              ],
                            ),
                          ),
                          // const Spacer(),
                          Image.network(
                            imageUrl,
                            height: 125,
                            fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null, // Progress indicator.
                                ),
                              );
                            },
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return const Icon(Icons.error, color: Colors.red);
                            },
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
