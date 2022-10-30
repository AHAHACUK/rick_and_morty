part of 'page_loader_bloc.dart';

@immutable
abstract class PageLoaderEvent extends ContentLoaderEvent{}
class NextButtonPressed extends PageLoaderEvent {}
class PrevButtonPressed extends PageLoaderEvent {}