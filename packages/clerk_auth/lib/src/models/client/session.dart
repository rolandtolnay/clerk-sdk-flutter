import 'package:clerk_auth/src/models/client/session_token.dart';
import 'package:clerk_auth/src/models/client/user.dart';
import 'package:clerk_auth/src/models/client/user_public.dart';
import 'package:clerk_auth/src/models/informative_to_string_mixin.dart';
import 'package:clerk_auth/src/models/status.dart';
import 'package:clerk_auth/src/utils/json_serialization_helpers.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'session.g.dart';

/// [Session] Clerk object
@immutable
@JsonSerializable()
class Session with InformativeToStringMixin {
  /// Constructor
  const Session({
    required this.id,
    required this.status,
    required this.lastActiveAt,
    required this.expireAt,
    required this.abandonAt,
    required this.publicUserData,
    required this.lastActiveOrganizationId,
    required this.user,
    this.lastActiveToken,
  });

  /// id
  final String id;

  /// status
  final Status status;

  /// public user data
  final UserPublic publicUserData;

  /// last active token
  final SessionToken? lastActiveToken;

  /// last active org id
  final String? lastActiveOrganizationId;

  /// user
  final User user;

  @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)

  /// last active at
  final DateTime lastActiveAt;

  /// expire at
  @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
  final DateTime expireAt;

  /// abandon at
  @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
  final DateTime abandonAt;

  /// is active?
  bool get isActive => status.isActive;

  /// fromJson
  static Session fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);

  /// toJson
  @override
  Map<String, dynamic> toJson() => _$SessionToJson(this);
}
