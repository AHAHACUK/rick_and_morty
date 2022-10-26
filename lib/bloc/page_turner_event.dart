part of 'page_turner_bloc.dart';

@immutable
abstract class PageTurnerEvent {}
class PageTurnerInit extends PageTurnerEvent {}
class PageFetchingError extends PageTurnerEvent {}
class PageLoaded<T> extends PageTurnerEvent {
  final Page<T> page;
  PageLoaded(this.page);
}
class NextButtonPressed extends PageTurnerEvent {}
class PrevButtonPressed extends PageTurnerEvent {}