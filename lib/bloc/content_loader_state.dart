part of 'content_loader_bloc.dart';

@immutable
abstract class ContentLoaderState {}

class NoContent extends ContentLoaderState {}
class ContentLoaded<T> extends ContentLoaderState {
  final T content;
  ContentLoaded(this.content);
}
class LoadingError extends ContentLoaderState {}
