import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "notification_id" field.
  String? _notificationId;
  String get notificationId => _notificationId ?? '';
  bool hasNotificationId() => _notificationId != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  void _initializeFields() {
    _notificationId = snapshotData['notification_id'] as String?;
    _content = snapshotData['content'] as String?;
    _status = snapshotData['status'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _userId = snapshotData['user_id'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  String? notificationId,
  String? content,
  String? status,
  DateTime? createdAt,
  DocumentReference? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'notification_id': notificationId,
      'content': content,
      'status': status,
      'created_at': createdAt,
      'user_id': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    return e1?.notificationId == e2?.notificationId &&
        e1?.content == e2?.content &&
        e1?.status == e2?.status &&
        e1?.createdAt == e2?.createdAt &&
        e1?.userId == e2?.userId;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash(
      [e?.notificationId, e?.content, e?.status, e?.createdAt, e?.userId]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
