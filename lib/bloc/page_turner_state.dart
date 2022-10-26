part of 'page_turner_bloc.dart';

@immutable
abstract class PageTurnerState<T> {}

class LoadingPage extends PageTurnerState {}
class PageError extends PageTurnerState {}
class PageShowing<T> extends PageTurnerState {
  final Page<T> page;
  PageShowing(this.page);
}
