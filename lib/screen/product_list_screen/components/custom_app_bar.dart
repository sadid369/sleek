// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sleek/utility/app_color.dart';
import 'package:sleek/utility/extensions.dart';
import '../../../models/user.dart';
import '../../../utility/constants.dart';
import '../../../widget/app_bar_action_button.dart';
import '../../../widget/custom_search_bar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(100);

  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(color: AppColor.darkGrey),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Sleek'),
            Container(
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text('Home'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('Contact'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('About'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            ),
            Container(
              width: 350,
              child: CustomSearchBar(
                controller: TextEditingController(),
                onChanged: (val) {
                  context.dataProvider.filterProducts(val);
                },
              ),
            ),
            Container(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_outline),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.shopping_cart_outlined),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
