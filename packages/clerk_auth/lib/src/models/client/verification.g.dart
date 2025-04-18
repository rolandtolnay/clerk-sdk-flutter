// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Verification _$VerificationFromJson(Map<String, dynamic> json) => Verification(
      status: Status.fromJson(json['status'] as String),
      strategy: Strategy.fromJson(json['strategy'] as String),
      attempts: (json['attempts'] as num?)?.toInt(),
      expireAt: intToDateTime(json['expire_at']),
      externalVerificationRedirectUrl:
          json['external_verification_redirect_url'] as String?,
      errorMessage: _extractErrorMessage(json, 'error_message') as String?,
      nonce: json['nonce'] as String?,
    );

Map<String, dynamic> _$VerificationToJson(Verification instance) =>
    <String, dynamic>{
      'status': instance.status.toJson(),
      'strategy': instance.strategy.toJson(),
      if (instance.attempts case final value?) 'attempts': value,
      if (instance.nonce case final value?) 'nonce': value,
      if (instance.externalVerificationRedirectUrl case final value?)
        'external_verification_redirect_url': value,
      'expire_at': dateTimeToInt(instance.expireAt),
      if (instance.errorMessage case final value?) 'error_message': value,
    };
