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

  // "match_id" field.
  String? _matchId;
  String get matchId => _matchId ?? '';
  bool hasMatchId() => _matchId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "started_at" field.
  DateTime? _startedAt;
  DateTime? get startedAt => _startedAt;
  bool hasStartedAt() => _startedAt != null;

  // "ended_at" field.
  DateTime? _endedAt;
  DateTime? get endedAt => _endedAt;
  bool hasEndedAt() => _endedAt != null;

  // "score_or_result" field.
  String? _scoreOrResult;
  String get scoreOrResult => _scoreOrResult ?? '';
  bool hasScoreOrResult() => _scoreOrResult != null;

  // "winner_id" field.
  DocumentReference? _winnerId;
  DocumentReference? get winnerId => _winnerId;
  bool hasWinnerId() => _winnerId != null;

  // "wager_id" field.
  DocumentReference? _wagerId;
  DocumentReference? get wagerId => _wagerId;
  bool hasWagerId() => _wagerId != null;

  void _initializeFields() {
    _matchId = snapshotData['match_id'] as String?;
    _status = snapshotData['status'] as String?;
    _startedAt = snapshotData['started_at'] as DateTime?;
    _endedAt = snapshotData['ended_at'] as DateTime?;
    _scoreOrResult = snapshotData['score_or_result'] as String?;
    _winnerId = snapshotData['winner_id'] as DocumentReference?;
    _wagerId = snapshotData['wager_id'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('matches');

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
  String? matchId,
  String? status,
  DateTime? startedAt,
  DateTime? endedAt,
  String? scoreOrResult,
  DocumentReference? winnerId,
  DocumentReference? wagerId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'match_id': matchId,
      'status': status,
      'started_at': startedAt,
      'ended_at': endedAt,
      'score_or_result': scoreOrResult,
      'winner_id': winnerId,
      'wager_id': wagerId,
    }.withoutNulls,
  );

  return firestoreData;
}

class MatchesRecordDocumentEquality implements Equality<MatchesRecord> {
  const MatchesRecordDocumentEquality();

  @override
  bool equals(MatchesRecord? e1, MatchesRecord? e2) {
    return e1?.matchId == e2?.matchId &&
        e1?.status == e2?.status &&
        e1?.startedAt == e2?.startedAt &&
        e1?.endedAt == e2?.endedAt &&
        e1?.scoreOrResult == e2?.scoreOrResult &&
        e1?.winnerId == e2?.winnerId &&
        e1?.wagerId == e2?.wagerId;
  }

  @override
  int hash(MatchesRecord? e) => const ListEquality().hash([
        e?.matchId,
        e?.status,
        e?.startedAt,
        e?.endedAt,
        e?.scoreOrResult,
        e?.winnerId,
        e?.wagerId
      ]);

  @override
  bool isValidKey(Object? o) => o is MatchesRecord;
}
