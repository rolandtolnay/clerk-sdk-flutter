// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json) => Session(
      id: json['id'] as String,
      status: $enumDecode(_$StatusEnumMap, json['status']),
      lastActiveAt: intToDateTime(json['last_active_at']),
      expireAt: intToDateTime(json['expire_at']),
      abandonAt: intToDateTime(json['abandon_at']),
      publicUserData:
          UserPublic.fromJson(json['public_user_data'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      lastActiveToken: json['last_active_token'] == null
          ? null
          : SessionToken.fromJson(
              json['last_active_token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      'id': instance.id,
      'status': _$StatusEnumMap[instance.status]!,
      'public_user_data': instance.publicUserData.toJson(),
      if (instance.lastActiveToken?.toJson() case final value?)
        'last_active_token': value,
      'user': instance.user.toJson(),
      if (instance.lastActiveAt?.toIso8601String() case final value?)
        'last_active_at': value,
      if (instance.expireAt?.toIso8601String() case final value?)
        'expire_at': value,
      if (instance.abandonAt?.toIso8601String() case final value?)
        'abandon_at': value,
    };

const _$StatusEnumMap = {
  Status.abandoned: 'abandoned',
  Status.active: 'active',
  Status.missingRequirements: 'missing_requirements',
  Status.needsIdentifier: 'needs_identifier',
  Status.needsFirstFactor: 'needs_first_factor',
  Status.needsSecondFactor: 'needs_second_factor',
  Status.transferable: 'transferable',
  Status.unverified: 'unverified',
  Status.verified: 'verified',
  Status.complete: 'complete',
  Status.expired: 'expired',
};
