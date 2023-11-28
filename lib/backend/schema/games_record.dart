import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GamesRecord extends FirestoreRecord {
  GamesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "image_icon" field.
  String? _imageIcon;
  String get imageIcon => _imageIcon ?? '';
  bool hasImageIcon() => _imageIcon != null;

  // "game_modes" field.
  List<String>? _gameModes;
  List<String> get gameModes => _gameModes ?? const [];
  bool hasGameModes() => _gameModes != null;

  // "supported_platforms" field.
  List<String>? _supportedPlatforms;
  List<String> get supportedPlatforms => _supportedPlatforms ?? const [];
  bool hasSupportedPlatforms() => _supportedPlatforms != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _imageIcon = snapshotData['image_icon'] as String?;
    _gameModes = getDataList(snapshotData['game_modes']);
    _supportedPlatforms = getDataList(snapshotData['supported_platforms']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Games');

  static Stream<GamesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GamesRecord.fromSnapshot(s));

  static Future<GamesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GamesRecord.fromSnapshot(s));

  static GamesRecord fromSnapshot(DocumentSnapshot snapshot) => GamesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GamesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GamesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GamesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GamesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGamesRecordData({
  String? name,
  String? description,
  String? imageIcon,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'image_icon': imageIcon,
    }.withoutNulls,
  );

  return firestoreData;
}

class GamesRecordDocumentEquality implements Equality<GamesRecord> {
  const GamesRecordDocumentEquality();

  @override
  bool equals(GamesRecord? e1, GamesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.imageIcon == e2?.imageIcon &&
        listEquality.equals(e1?.gameModes, e2?.gameModes) &&
        listEquality.equals(e1?.supportedPlatforms, e2?.supportedPlatforms);
  }

  @override
  int hash(GamesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.imageIcon,
        e?.gameModes,
        e?.supportedPlatforms
      ]);

  @override
  bool isValidKey(Object? o) => o is GamesRecord;
}
