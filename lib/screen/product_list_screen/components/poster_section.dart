import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:sleek/screen/product_list_screen/components/category_selector.dart';
import 'package:sleek/utility/app_color.dart';

import '../../../core/data/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../utility/app_data.dart';
import '../../../utility/animation/open_container_wrapper.dart';
import '../../../utility/constants.dart';
import '../../product_by_category_screen/product_by_category_screen.dart';

class PosterSection extends StatefulWidget {
  const PosterSection({super.key});

  @override
  State<PosterSection> createState() => _PosterSectionState();
}

class _PosterSectionState extends State<PosterSection> {
  int _indexNumber = 0;
  CarouselSliderController carouselController = CarouselSliderController();
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
                child: Container(
                  margin: const EdgeInsets.only(right: 20),
                  decoration: const BoxDecoration(
                      border: Border(
                    right: BorderSide(
                      width: 1,
                      color: AppColor.darkGrey,
                    ),
                  )),
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
              ),
              Expanded(
                flex: 6,
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: CarouselSlider.builder(
                        carouselController: carouselController,
                        options: CarouselOptions(
                          onPageChanged: (index, reason) {
                            setState(() {
                              _indexNumber = index;
                            });
                          },
                          viewportFraction: 1,
                          autoPlay: true,
                          initialPage: _indexNumber,
                        ),
                        itemCount: dataProvider.posters.length,
                        itemBuilder: (context, index, realIndex) {
                          String? url = dataProvider.posters[index].imageUrl;
                          String imageUrl = url!.replaceAll(LOCALHOST, IP);
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                            borderRadius:
                                                BorderRadius.circular(18),
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
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null, // Progress indicator.
                                      ),
                                    );
                                  },
                                  errorBuilder: (BuildContext context,
                                      Object exception,
                                      StackTrace? stackTrace) {
                                    return const Icon(Icons.error,
                                        color: Colors.red);
                                  },
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 380,
                      child: DotsIndicator(
                        dotsCount: dataProvider.categories.length,
                        position: _indexNumber,
                        onTap: (position) {
                          carouselController.jumpToPage(position);
                        },
                        decorator: DotsDecorator(
                          size: const Size.fromRadius(5),
                          activeSize: const Size.fromRadius(7),
                          activeColor: AppColor.darkOrange,
                          color: Colors.white,
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              side: const BorderSide(color: Colors.white)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
