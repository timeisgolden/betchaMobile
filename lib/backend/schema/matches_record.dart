import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MatchesRecord extends FirestoreRecord {
  MatchesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "wagerId" field.
  DocumentReference? _wagerId;
  DocumentReference? get wagerId => _wagerId;
  bool hasWagerId() => _wagerId != null;

  // "startedAt" field.
  DateTime? _startedAt;
  DateTime? get startedAt => _startedAt;
  bool hasStartedAt() => _startedAt != null;

  // "endedAt" field.
  DateTime? _endedAt;
  DateTime? get endedAt => _endedAt;
  bool hasEndedAt() => _endedAt != null;

  // "winnerId" field.
  DocumentReference? _winnerId;
  DocumentReference? get winnerId => _winnerId;
  bool hasWinnerId() => _winnerId != null;

  // "scoreOrResult" field.
  String? _scoreOrResult;
  String get scoreOrResult => _scoreOrResult ?? '';
  bool hasScoreOrResult() => _scoreOrResult != null;

  // "status" field.
  EnumMatchStatus? _status;
  EnumMatchStatus? get status => _status;
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _wagerId = snapshotData['wagerId'] as DocumentReference?;
    _startedAt = snapshotData['startedAt'] as DateTime?;
    _endedAt = snapshotData['endedAt'] as DateTime?;
    _winnerId = snapshotData['winnerId'] as DocumentReference?;
    _scoreOrResult = snapshotData['scoreOrResult'] as String?;
    _status = deserializeEnum<EnumMatchStatus>(snapshotData['status']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Matches');

  static Stream<MatchesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MatchesRecord.fromSnapshot(s));

  static Future<MatchesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MatchesRecord.fromSnapshot(s));

  static MatchesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MatchesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MatchesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MatchesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MatchesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MatchesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMatchesRecordData({
  DocumentReference? wagerId,
  DateTime? startedAt,
  DateTime? endedAt,
  DocumentReference? winnerId,
  String? scoreOrResult,
  EnumMatchStatus? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'wagerId': wagerId,
      'startedAt': startedAt,
      'endedAt': endedAt,
      'winnerId': winnerId,
      'scoreOrResult': scoreOrResult,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class MatchesRecordDocumentEquality implements Equality<MatchesRecord> {
  const MatchesRecordDocumentEquality();

  @override
  bool equals(MatchesRecord? e1, MatchesRecord? e2) {
    return e1?.wagerId == e2?.wagerId &&
        e1?.startedAt == e2?.startedAt &&
        e1?.endedAt == e2?.endedAt &&
        e1?.winnerId == e2?.winnerId &&
        e1?.scoreOrResult == e2?.scoreOrResult &&
        e1?.status == e2?.status;
  }

  @override
  int hash(MatchesRecord? e) => const ListEquality().hash([
        e?.wagerId,
        e?.startedAt,
        e?.endedAt,
        e?.winnerId,
        e?.scoreOrResult,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is MatchesRecord;
}
