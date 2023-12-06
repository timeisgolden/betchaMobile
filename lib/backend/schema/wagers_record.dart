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

  // "initiatorId" field.
  DocumentReference? _initiatorId;
  DocumentReference? get initiatorId => _initiatorId;
  bool hasInitiatorId() => _initiatorId != null;

  // "gameId" field.
  DocumentReference? _gameId;
  DocumentReference? get gameId => _gameId;
  bool hasGameId() => _gameId != null;

  // "selectedGameMode" field.
  String? _selectedGameMode;
  String get selectedGameMode => _selectedGameMode ?? '';
  bool hasSelectedGameMode() => _selectedGameMode != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "participants" field.
  List<DocumentReference>? _participants;
  List<DocumentReference> get participants => _participants ?? const [];
  bool hasParticipants() => _participants != null;

  // "acceptedBy" field.
  DocumentReference? _acceptedBy;
  DocumentReference? get acceptedBy => _acceptedBy;
  bool hasAcceptedBy() => _acceptedBy != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "winnerId" field.
  DocumentReference? _winnerId;
  DocumentReference? get winnerId => _winnerId;
  bool hasWinnerId() => _winnerId != null;

  // "completedAt" field.
  DateTime? _completedAt;
  DateTime? get completedAt => _completedAt;
  bool hasCompletedAt() => _completedAt != null;

  // "privacySettings" field.
  String? _privacySettings;
  String get privacySettings => _privacySettings ?? '';
  bool hasPrivacySettings() => _privacySettings != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _initiatorId = snapshotData['initiatorId'] as DocumentReference?;
    _gameId = snapshotData['gameId'] as DocumentReference?;
    _selectedGameMode = snapshotData['selectedGameMode'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
    _participants = getDataList(snapshotData['participants']);
    _acceptedBy = snapshotData['acceptedBy'] as DocumentReference?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _winnerId = snapshotData['winnerId'] as DocumentReference?;
    _completedAt = snapshotData['completedAt'] as DateTime?;
    _privacySettings = snapshotData['privacySettings'] as String?;
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('wagers');

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
  DocumentReference? initiatorId,
  DocumentReference? gameId,
  String? selectedGameMode,
  double? amount,
  DocumentReference? acceptedBy,
  DateTime? createdAt,
  DocumentReference? winnerId,
  DateTime? completedAt,
  String? privacySettings,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'initiatorId': initiatorId,
      'gameId': gameId,
      'selectedGameMode': selectedGameMode,
      'amount': amount,
      'acceptedBy': acceptedBy,
      'createdAt': createdAt,
      'winnerId': winnerId,
      'completedAt': completedAt,
      'privacySettings': privacySettings,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class WagersRecordDocumentEquality implements Equality<WagersRecord> {
  const WagersRecordDocumentEquality();

  @override
  bool equals(WagersRecord? e1, WagersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.initiatorId == e2?.initiatorId &&
        e1?.gameId == e2?.gameId &&
        e1?.selectedGameMode == e2?.selectedGameMode &&
        e1?.amount == e2?.amount &&
        listEquality.equals(e1?.participants, e2?.participants) &&
        e1?.acceptedBy == e2?.acceptedBy &&
        e1?.createdAt == e2?.createdAt &&
        e1?.winnerId == e2?.winnerId &&
        e1?.completedAt == e2?.completedAt &&
        e1?.privacySettings == e2?.privacySettings &&
        e1?.status == e2?.status;
  }

  @override
  int hash(WagersRecord? e) => const ListEquality().hash([
        e?.initiatorId,
        e?.gameId,
        e?.selectedGameMode,
        e?.amount,
        e?.participants,
        e?.acceptedBy,
        e?.createdAt,
        e?.winnerId,
        e?.completedAt,
        e?.privacySettings,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is WagersRecord;
}
