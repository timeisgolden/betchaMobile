import 'package:collection/collection.dart';

enum FriendRequestStatus {
  pending,
  accepted,
  declined,
}

enum EnumPrivacySetting {
  Public,
  FriendsOnly,
  Private,
}

enum EnumWagerStatus {
  Pending,
  Accepted,
  Completed,
  Cancelled,
}

enum EnumMatchStatus {
  Pending,
  Ongoing,
  Completed,
}

enum EnumTabNames {
  Home,
  Friends,
  Wagers,
  Chat,
  Profile,
  Inbox,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (FriendRequestStatus):
      return FriendRequestStatus.values.deserialize(value) as T?;
    case (EnumPrivacySetting):
      return EnumPrivacySetting.values.deserialize(value) as T?;
    case (EnumWagerStatus):
      return EnumWagerStatus.values.deserialize(value) as T?;
    case (EnumMatchStatus):
      return EnumMatchStatus.values.deserialize(value) as T?;
    case (EnumTabNames):
      return EnumTabNames.values.deserialize(value) as T?;
    default:
      return null;
  }
}
