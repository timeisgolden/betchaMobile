import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FriendRequestsRecord extends FirestoreRecord {
  FriendRequestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "request_time" field.
  DateTime? _requestTime;
  DateTime? get requestTime => _requestTime;
  bool hasRequestTime() => _requestTime != null;

  // "sender_id" field.
  DocumentReference? _senderId;
  DocumentReference? get senderId => _senderId;
  bool hasSenderId() => _senderId != null;

  // "receiver_id" field.
  DocumentReference? _receiverId;
  DocumentReference? get receiverId => _receiverId;
  bool hasReceiverId() => _receiverId != null;

  // "rejected_time" field.
  DateTime? _rejectedTime;
  DateTime? get rejectedTime => _rejectedTime;
  bool hasRejectedTime() => _rejectedTime != null;

  void _initializeFields() {
    _status = snapshotData['status'] as String?;
    _requestTime = snapshotData['request_time'] as DateTime?;
    _senderId = snapshotData['sender_id'] as DocumentReference?;
    _receiverId = snapshotData['receiver_id'] as DocumentReference?;
    _rejectedTime = snapshotData['rejected_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('FriendRequests');

  static Stream<FriendRequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FriendRequestsRecord.fromSnapshot(s));

  static Future<FriendRequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FriendRequestsRecord.fromSnapshot(s));

  static FriendRequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FriendRequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FriendRequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FriendRequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FriendRequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FriendRequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFriendRequestsRecordData({
  String? status,
  DateTime? requestTime,
  DocumentReference? senderId,
  DocumentReference? receiverId,
  DateTime? rejectedTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'status': status,
      'request_time': requestTime,
      'sender_id': senderId,
      'receiver_id': receiverId,
      'rejected_time': rejectedTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class FriendRequestsRecordDocumentEquality
    implements Equality<FriendRequestsRecord> {
  const FriendRequestsRecordDocumentEquality();

  @override
  bool equals(FriendRequestsRecord? e1, FriendRequestsRecord? e2) {
    return e1?.status == e2?.status &&
        e1?.requestTime == e2?.requestTime &&
        e1?.senderId == e2?.senderId &&
        e1?.receiverId == e2?.receiverId &&
        e1?.rejectedTime == e2?.rejectedTime;
  }

  @override
  int hash(FriendRequestsRecord? e) => const ListEquality().hash(
      [e?.status, e?.requestTime, e?.senderId, e?.receiverId, e?.rejectedTime]);

  @override
  bool isValidKey(Object? o) => o is FriendRequestsRecord;
}
