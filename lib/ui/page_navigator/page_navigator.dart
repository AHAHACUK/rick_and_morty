import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/content_page.dart';
import 'package:rick_and_morty/ui/page_navigator/page_navigator_base.dart';

class PageNavigator extends PageNavigatorBase {
  final void Function(int) onPageSelected;
  final ContentPage currentPage;
  final int pageOffset;
  const PageNavigator(this.currentPage, this.onPageSelected,
      {Key? key, this.pageOffset = 2})
      : super(key: key);

  @override
  Widget buildLeft(BuildContext context) => IconButton(
      onPressed: () => onPageSelected(currentPage.number - 1),
      icon: const Icon(Icons.arrow_left));

  @override
  Widget buildRight(BuildContext context) => IconButton(
      onPressed: () => onPageSelected(currentPage.number + 1),
      icon: const Icon(Icons.arrow_right));

  @override
  Widget buildMiddle(BuildContext context) {
    int pages = 1 + pageOffset * 2;
    int spacers = pages - 1;
    int widgetCount = pages + spacers;
    int centerPage = currentPage.number;
    List<int> pageNumbers = [
      for (int i = centerPage - pageOffset; i <= centerPage + pageOffset; i++) i
    ];
    List<Widget> widgets = [];
    for (int i = 0; i < widgetCount; i++) {
      if (i % 2 == 0) {
        int pageNumber = pageNumbers[i ~/ 2];
        if (pageNumber == centerPage) {
           widgets.add(_buildSelectedPage(pageNumber));
        }
        else if (pageNumber >= 1 && pageNumber <= pages) {
          widgets.add(_buildPageButton(pageNumber));
        } else {
          widgets.add(_buildPageButton(null));
        }
      } else {
        widgets.add(_buildSpacer());
      }
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, children: widgets);
  }

  Widget _buildPageButton(int? pageNumber) {
    int flex = 2;
    if (pageNumber != null) {
      return Expanded(
          flex: flex,
          child: GestureDetector(
              onTap: () => onPageSelected(pageNumber),
              child: Container(decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: Color.fromARGB(20, 0, 0, 0)),
                  child: Center(child: Text(pageNumber.toString())))));
    } else {
      return Spacer(flex: flex);
    }
  }

  Widget _buildSelectedPage(int? pageNumber) {
    int flex = 2;
    if (pageNumber != null) {
      return Expanded(
          flex: flex,
          child: Container(decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: Color.fromARGB(50, 0, 0, 0)),
              child: Center(child: Text(pageNumber.toString()))));
    } else {
      return Spacer(flex: flex);
    }
  }

  Widget _buildSpacer() => const Spacer(flex: 1);
}
