part of 'page_turner_bloc.dart';

@immutable
abstract class PageTurnerEvent {}
class PageTurnerInit extends PageTurnerEvent {}
class NextButtonPressed extends PageTurnerEvent {}
class PrevButtonPressed extends PageTurnerEvent {}