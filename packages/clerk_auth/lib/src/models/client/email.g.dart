// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Email _$EmailFromJson(Map<String, dynamic> json) => Email(
      id: json['id'] as String,
      verification: json['verification'] == null
          ? null
          : Verification.fromJson(json['verification'] as Map<String, dynamic>),
      emailAddress: json['email_address'] as String,
      reserved: json['reserved'] as bool,
      updatedAt: intToDateTime(json['updated_at']),
      createdAt: intToDateTime(json['created_at']),
    );

Map<String, dynamic> _$EmailToJson(Email instance) => <String, dynamic>{
      'id': instance.id,
      if (instance.verification?.toJson() case final value?)
        'verification': value,
      'email_address': instance.emailAddress,
      'reserved': instance.reserved,
      'updated_at': dateTimeToInt(instance.updatedAt),
      'created_at': dateTimeToInt(instance.createdAt),
    };
