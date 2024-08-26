import 'package:flutter/material.dart';
import 'package:sleek/widget/proudct_card.dart';

import '../models/product.dart';
import '../screen/product_details_screen/product_detail_screen.dart';
import '../utility/animation/open_container_wrapper.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    super.key,
    required this.items,
  });

  final List<Product> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GridView.builder(
        itemCount: items.length,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 10 / 16,
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          Product product = items[index];
          return OpenContainerWrapper(
            nextScreen: ProductDetailScreen(product),
            child: ProductCard(
              imageUrl: product.images![0].url!,
              categoryName: product.proCategoryId!.name!,
              productName: product.name!,
              price: product.price!,
              discountPercentage: product.offerPrice,
              rating: 5,
              shortDescription: product.description,
              currency: 'BDT ',
            ),
          );
        },
      ),
    );
  }
}
