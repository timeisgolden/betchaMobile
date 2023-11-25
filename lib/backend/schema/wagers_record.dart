import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WagersRecord extends FirestoreRecord {
  WagersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "game_id" field.
  DocumentReference? _gameId;
  DocumentReference? get gameId => _gameId;
  bool hasGameId() => _gameId != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "completed_at" field.
  DateTime? _completedAt;
  DateTime? get completedAt => _completedAt;
  bool hasCompletedAt() => _completedAt != null;

  // "wager_id" field.
  String? _wagerId;
  String get wagerId => _wagerId ?? '';
  bool hasWagerId() => _wagerId != null;

  // "initiator_id" field.
  DocumentReference? _initiatorId;
  DocumentReference? get initiatorId => _initiatorId;
  bool hasInitiatorId() => _initiatorId != null;

  // "accepting_id" field.
  DocumentReference? _acceptingId;
  DocumentReference? get acceptingId => _acceptingId;
  bool hasAcceptingId() => _acceptingId != null;

  // "winner_id" field.
  DocumentReference? _winnerId;
  DocumentReference? get winnerId => _winnerId;
  bool hasWinnerId() => _winnerId != null;

  void _initializeFields() {
    _gameId = snapshotData['game_id'] as DocumentReference?;
    _amount = castToType<double>(snapshotData['amount']);
    _status = snapshotData['status'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _completedAt = snapshotData['completed_at'] as DateTime?;
    _wagerId = snapshotData['wager_id'] as String?;
    _initiatorId = snapshotData['initiator_id'] as DocumentReference?;
    _acceptingId = snapshotData['accepting_id'] as DocumentReference?;
    _winnerId = snapshotData['winner_id'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Wagers');

  static Stream<WagersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WagersRecord.fromSnapshot(s));

  static Future<WagersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WagersRecord.fromSnapshot(s));

  static WagersRecord fromSnapshot(DocumentSnapshot snapshot) => WagersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WagersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WagersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WagersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WagersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWagersRecordData({
  DocumentReference? gameId,
  double? amount,
  String? status,
  DateTime? createdAt,
  DateTime? completedAt,
  String? wagerId,
  DocumentReference? initiatorId,
  DocumentReference? acceptingId,
  DocumentReference? winnerId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'game_id': gameId,
      'amount': amount,
      'status': status,
      'created_at': createdAt,
      'completed_at': completedAt,
      'wager_id': wagerId,
      'initiator_id': initiatorId,
      'accepting_id': acceptingId,
      'winner_id': winnerId,
    }.withoutNulls,
  );

  return firestoreData;
}

class WagersRecordDocumentEquality implements Equality<WagersRecord> {
  const WagersRecordDocumentEquality();

  @override
  bool equals(WagersRecord? e1, WagersRecord? e2) {
    return e1?.gameId == e2?.gameId &&
        e1?.amount == e2?.amount &&
        e1?.status == e2?.status &&
        e1?.createdAt == e2?.createdAt &&
        e1?.completedAt == e2?.completedAt &&
        e1?.wagerId == e2?.wagerId &&
        e1?.initiatorId == e2?.initiatorId &&
        e1?.acceptingId == e2?.acceptingId &&
        e1?.winnerId == e2?.winnerId;
  }

  @override
  int hash(WagersRecord? e) => const ListEquality().hash([
        e?.gameId,
        e?.amount,
        e?.status,
        e?.createdAt,
        e?.completedAt,
        e?.wagerId,
        e?.initiatorId,
        e?.acceptingId,
        e?.winnerId
      ]);

  @override
  bool isValidKey(Object? o) => o is WagersRecord;
}
