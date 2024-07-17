part of 'rhymes_list_bloc.dart';

sealed class RhymesListEvent {
  const RhymesListEvent();

  @override
  List<Object> get props => [];
}

class SearchRhymes extends RhymesListEvent {
  const SearchRhymes({required this.query});
  final String query;

  @override
  List<Object> get props => super.props..addAll([query]);
}
