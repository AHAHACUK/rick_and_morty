import 'package:rick_and_morty/models/content_page.dart';

abstract class PageFetcher<T> {
  Future<ContentPage<T>?> fetchPage(int page);
}