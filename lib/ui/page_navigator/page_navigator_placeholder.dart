import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/ui/page_navigator/page_navigator_base.dart';

class PageNavigatorPlaceholder extends PageNavigatorBase {
  static const Color color = Colors.grey;
  const PageNavigatorPlaceholder({Key? key}) : super(key: key);

  @override
  Widget buildLeft(BuildContext context) => const Icon(Icons.arrow_left, color: color);

  @override
  Widget buildMiddle(BuildContext context) => Container(color: color);

  @override
  Widget buildRight(BuildContext context) => const Icon(Icons.arrow_right, color: color);
}
