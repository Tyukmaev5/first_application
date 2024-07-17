import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhymer/api/api.dart';
import 'package:rhymer/api/models/rhymes.dart';

part 'rhymes_list_event.dart';
part 'rhymes_list_state.dart';

class RhymesListBloc extends Bloc<RhymesListEvent, RhymesListState> {
  RhymesListBloc({
    required this.apiClient,
  }) : super(RhymesListInitial()) {
    on<RhymesListEvent>(
        _onSearch as EventHandler<RhymesListEvent, RhymesListState>);
  }

  final RhymerApiClient apiClient;

  Future<void> _onSearch(
    SearchRhymes event,
    Emitter<RhymesListState> emit,
  ) async {
    try {
      final rhymes = await apiClient.getRhymesList(event.query);
    } catch (e) {
      emit(RhymesListFailure(error: e));
    }
  }
}
