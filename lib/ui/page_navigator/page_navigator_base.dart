import 'package:flutter/cupertino.dart';

abstract class PageNavigatorBase extends StatelessWidget {
  const PageNavigatorBase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(flex: 1, child: buildLeft(context)),
      const SizedBox(width: 4),
      Expanded(flex: 3, child: buildMiddle(context)),
      const SizedBox(width: 4),
      Expanded(flex: 1, child: buildRight(context)),
    ]);
  }

  @protected
  Widget buildLeft(BuildContext context);
  @protected
  Widget buildMiddle(BuildContext context);
  @protected
  Widget buildRight(BuildContext context);
}