import 'package:rhymer/repositories/history/models/history_rhymes.dart';

abstract interface class HistoryRepositoryInterface {
  Future<List<HistoryRhymes>> getRhymesList();
  Future<void> setRhymes(HistoryRhymes rhymes);
  Future<void> clear();
}
