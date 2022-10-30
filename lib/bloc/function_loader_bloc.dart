import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/bloc/content_loader_bloc.dart';

class FunctionLoaderBloc<T> extends ContentLoaderBloc<T> {
  final Future<T?> Function() _fetcherFunction;
  @override
  Future<T?> Function() get fetcher => _fetcherFunction;
  FunctionLoaderBloc(this._fetcherFunction) : super();
}
