import 'package:json_annotation/json_annotation.dart';
import 'package:realm/realm.dart';

import '../../repositories/history/history.dart';

part 'rhymes.g.dart';

@JsonSerializable()
class Rhymes {
  const Rhymes({required this.words});

  factory Rhymes.fromJson(Map<String, dynamic> json) => _$RhymesFromJson(json);

  final List<String> words;

  Map<String, dynamic> toJson() => _$RhymesToJson(this);

  HistoryRhymes toHistory(String word) => HistoryRhymes(
        Uuid.v4().toString(),
        word,
        words: words,
      );
}
