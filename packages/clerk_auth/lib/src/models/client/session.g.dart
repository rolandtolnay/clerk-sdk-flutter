// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json) => Session(
      id: json['id'] as String,
      status: Status.fromJson(json['status'] as String),
      lastActiveAt: intToDateTime(json['last_active_at']),
      expireAt: intToDateTime(json['expire_at']),
      abandonAt: intToDateTime(json['abandon_at']),
      publicUserData:
          UserPublic.fromJson(json['public_user_data'] as Map<String, dynamic>),
      lastActiveOrganizationId: json['last_active_organization_id'] as String?,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      lastActiveToken: json['last_active_token'] == null
          ? null
          : SessionToken.fromJson(
              json['last_active_token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      'id': instance.id,
      'status': instance.status.toJson(),
      'public_user_data': instance.publicUserData.toJson(),
      if (instance.lastActiveToken?.toJson() case final value?)
        'last_active_token': value,
      if (instance.lastActiveOrganizationId case final value?)
        'last_active_organization_id': value,
      'user': instance.user.toJson(),
      'last_active_at': dateTimeToInt(instance.lastActiveAt),
      'expire_at': dateTimeToInt(instance.expireAt),
      'abandon_at': dateTimeToInt(instance.abandonAt),
    };
