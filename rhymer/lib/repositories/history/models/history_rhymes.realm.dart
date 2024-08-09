// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_rhymes.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class HistoryRhymes extends _HistoryRhymes
    with RealmEntity, RealmObjectBase, RealmObject {
  HistoryRhymes(
    String id,
    String word, {
    Iterable<String> words = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'word', word);
    RealmObjectBase.set<RealmList<String>>(
        this, 'words', RealmList<String>(words));
  }

  HistoryRhymes._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get word => RealmObjectBase.get<String>(this, 'word') as String;
  @override
  set word(String value) => RealmObjectBase.set(this, 'word', value);

  @override
  RealmList<String> get words =>
      RealmObjectBase.get<String>(this, 'words') as RealmList<String>;
  @override
  set words(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<HistoryRhymes>> get changes =>
      RealmObjectBase.getChanges<HistoryRhymes>(this);

  @override
  Stream<RealmObjectChanges<HistoryRhymes>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<HistoryRhymes>(this, keyPaths);

  @override
  HistoryRhymes freeze() => RealmObjectBase.freezeObject<HistoryRhymes>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'word': word.toEJson(),
      'words': words.toEJson(),
    };
  }

  static EJsonValue _toEJson(HistoryRhymes value) => value.toEJson();
  static HistoryRhymes _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'word': EJsonValue word,
        'words': EJsonValue words,
      } =>
        HistoryRhymes(
          fromEJson(id),
          fromEJson(word),
          words: fromEJson(words),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(HistoryRhymes._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.realmObject, HistoryRhymes, 'HistoryRhymes', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('word', RealmPropertyType.string),
      SchemaProperty('words', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
