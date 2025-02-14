// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      id: json['id'] as String?,
      signIn: json['sign_in'] == null
          ? null
          : SignIn.fromJson(json['sign_in'] as Map<String, dynamic>),
      signUp: json['sign_up'] == null
          ? null
          : SignUp.fromJson(json['sign_up'] as Map<String, dynamic>),
      sessions: (json['sessions'] as List<dynamic>?)
              ?.map((e) => Session.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      lastActiveSessionId: json['last_active_session_id'] as String?,
      updatedAt: json['updated_at'] == null
          ? DateTimeExt.epoch
          : intToDateTime(json['updated_at']),
      createdAt: json['created_at'] == null
          ? DateTimeExt.epoch
          : intToDateTime(json['created_at']),
    );

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.signIn?.toJson() case final value?) 'sign_in': value,
      if (instance.signUp?.toJson() case final value?) 'sign_up': value,
      if (instance.lastActiveSessionId case final value?)
        'last_active_session_id': value,
      'sessions': instance.sessions.map((e) => e.toJson()).toList(),
      'updated_at': dateTimeToInt(instance.updatedAt),
      'created_at': dateTimeToInt(instance.createdAt),
    };
