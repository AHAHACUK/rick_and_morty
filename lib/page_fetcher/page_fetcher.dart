import 'package:rick_and_morty/models/page.dart';

abstract class PageFetcher<T> {
  
  Future<T> fetchItemById(int id);
  Future<Page<T>> fetchPage(int page);
}