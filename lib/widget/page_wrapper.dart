import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PageWrapper extends StatelessWidget {
  final Widget child;
  const PageWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width > 1100) {
      width = width * 0.9;
    } else if (width < 600) {
      width = 800;
    }
    return Center(
      child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: width), child: child),
    );
  }
}
