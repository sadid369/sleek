import 'package:flutter/material.dart';
import 'package:sleek/widget/proudct_card.dart';

import '../models/product.dart';
import '../screen/product_details_screen/product_detail_screen.dart';
import '../utility/animation/open_container_wrapper.dart';
import 'product_grid_tile.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({
    super.key,
    required this.items,
  });

  final List<Product> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      padding: const EdgeInsets.only(top: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        // shrinkWrap: true,
        // physics: const ScrollPhysics(),
        itemBuilder: (context, index) {
          Product product = items[index];
          return OpenContainerWrapper(
            nextScreen: ProductDetailScreen(product),
            child: Container(
              height: 200,
              width: 180,
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
            ),
          );
        },
      ),
    );
  }
}
