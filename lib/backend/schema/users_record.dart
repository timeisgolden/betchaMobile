import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "last_login" field.
  DateTime? _lastLogin;
  DateTime? get lastLogin => _lastLogin;
  bool hasLastLogin() => _lastLogin != null;

  // "twitch_link" field.
  String? _twitchLink;
  String get twitchLink => _twitchLink ?? '';
  bool hasTwitchLink() => _twitchLink != null;

  // "youtube_link" field.
  String? _youtubeLink;
  String get youtubeLink => _youtubeLink ?? '';
  bool hasYoutubeLink() => _youtubeLink != null;

  // "paypal_info" field.
  String? _paypalInfo;
  String get paypalInfo => _paypalInfo ?? '';
  bool hasPaypalInfo() => _paypalInfo != null;

  // "wallet_ballance" field.
  double? _walletBallance;
  double get walletBallance => _walletBallance ?? 0.0;
  bool hasWalletBallance() => _walletBallance != null;

  // "allow_push_notifications" field.
  bool? _allowPushNotifications;
  bool get allowPushNotifications => _allowPushNotifications ?? false;
  bool hasAllowPushNotifications() => _allowPushNotifications != null;

  // "allow_payment_notifications" field.
  bool? _allowPaymentNotifications;
  bool get allowPaymentNotifications => _allowPaymentNotifications ?? false;
  bool hasAllowPaymentNotifications() => _allowPaymentNotifications != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "last_active_time" field.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _lastLogin = snapshotData['last_login'] as DateTime?;
    _twitchLink = snapshotData['twitch_link'] as String?;
    _youtubeLink = snapshotData['youtube_link'] as String?;
    _paypalInfo = snapshotData['paypal_info'] as String?;
    _walletBallance = castToType<double>(snapshotData['wallet_ballance']);
    _allowPushNotifications = snapshotData['allow_push_notifications'] as bool?;
    _allowPaymentNotifications =
        snapshotData['allow_payment_notifications'] as bool?;
    _shortDescription = snapshotData['shortDescription'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _role = snapshotData['role'] as String?;
    _title = snapshotData['title'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  DateTime? lastLogin,
  String? twitchLink,
  String? youtubeLink,
  String? paypalInfo,
  double? walletBallance,
  bool? allowPushNotifications,
  bool? allowPaymentNotifications,
  String? shortDescription,
  DateTime? lastActiveTime,
  String? role,
  String? title,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'last_login': lastLogin,
      'twitch_link': twitchLink,
      'youtube_link': youtubeLink,
      'paypal_info': paypalInfo,
      'wallet_ballance': walletBallance,
      'allow_push_notifications': allowPushNotifications,
      'allow_payment_notifications': allowPaymentNotifications,
      'shortDescription': shortDescription,
      'last_active_time': lastActiveTime,
      'role': role,
      'title': title,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.lastLogin == e2?.lastLogin &&
        e1?.twitchLink == e2?.twitchLink &&
        e1?.youtubeLink == e2?.youtubeLink &&
        e1?.paypalInfo == e2?.paypalInfo &&
        e1?.walletBallance == e2?.walletBallance &&
        e1?.allowPushNotifications == e2?.allowPushNotifications &&
        e1?.allowPaymentNotifications == e2?.allowPaymentNotifications &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.role == e2?.role &&
        e1?.title == e2?.title;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.lastLogin,
        e?.twitchLink,
        e?.youtubeLink,
        e?.paypalInfo,
        e?.walletBallance,
        e?.allowPushNotifications,
        e?.allowPaymentNotifications,
        e?.shortDescription,
        e?.lastActiveTime,
        e?.role,
        e?.title
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
