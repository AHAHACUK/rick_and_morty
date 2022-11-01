part of 'page_loader_bloc.dart';

@immutable
abstract class PageLoaderEvent extends ContentLoaderEvent{}
class PageOrdered extends PageLoaderEvent {
  final int pageNumber;
  PageOrdered(this.pageNumber);
}