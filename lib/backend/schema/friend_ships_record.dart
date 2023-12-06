import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FriendShipsRecord extends FirestoreRecord {
  FriendShipsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "established" field.
  DateTime? _established;
  DateTime? get established => _established;
  bool hasEstablished() => _established != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _status = snapshotData['status'] as String?;
    _established = snapshotData['established'] as DateTime?;
    _userId = snapshotData['user_id'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('friendShips')
          : FirebaseFirestore.instance.collectionGroup('friendShips');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('friendShips').doc();

  static Stream<FriendShipsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FriendShipsRecord.fromSnapshot(s));

  static Future<FriendShipsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FriendShipsRecord.fromSnapshot(s));

  static FriendShipsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FriendShipsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FriendShipsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FriendShipsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FriendShipsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FriendShipsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFriendShipsRecordData({
  String? status,
  DateTime? established,
  DocumentReference? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'status': status,
      'established': established,
      'user_id': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class FriendShipsRecordDocumentEquality implements Equality<FriendShipsRecord> {
  const FriendShipsRecordDocumentEquality();

  @override
  bool equals(FriendShipsRecord? e1, FriendShipsRecord? e2) {
    return e1?.status == e2?.status &&
        e1?.established == e2?.established &&
        e1?.userId == e2?.userId;
  }

  @override
  int hash(FriendShipsRecord? e) =>
      const ListEquality().hash([e?.status, e?.established, e?.userId]);

  @override
  bool isValidKey(Object? o) => o is FriendShipsRecord;
}
