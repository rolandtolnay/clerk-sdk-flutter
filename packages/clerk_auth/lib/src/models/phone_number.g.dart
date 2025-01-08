// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneNumber _$PhoneNumberFromJson(Map<String, dynamic> json) => PhoneNumber(
      id: json['id'] as String,
      verification: json['verification'] == null
          ? null
          : Verification.fromJson(json['verification'] as Map<String, dynamic>),
      phoneNumber: json['phone_number'] as String,
      reserved: json['reserved'] as bool,
      reservedForSecondFactor: json['reserved_for_second_factor'] as bool,
      defaultSecondFactor: json['default_second_factor'] as bool,
      updatedAt: intToDateTime(json['updated_at']),
      createdAt: intToDateTime(json['created_at']),
    );

Map<String, dynamic> _$PhoneNumberToJson(PhoneNumber instance) =>
    <String, dynamic>{
      'id': instance.id,
      if (instance.verification?.toJson() case final value?)
        'verification': value,
      'phone_number': instance.phoneNumber,
      'reserved': instance.reserved,
      'reserved_for_second_factor': instance.reservedForSecondFactor,
      'default_second_factor': instance.defaultSecondFactor,
      if (instance.updatedAt?.toIso8601String() case final value?)
        'updated_at': value,
      if (instance.createdAt?.toIso8601String() case final value?)
        'created_at': value,
    };
