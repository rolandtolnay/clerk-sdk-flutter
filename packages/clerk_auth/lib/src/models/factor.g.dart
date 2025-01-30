// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'factor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Factor _$FactorFromJson(Map<String, dynamic> json) => Factor(
      strategy: Strategy.fromJson(json['strategy'] as String),
      safeIdentifier: json['safe_identifier'] as String?,
      emailAddressId: json['email_address_id'] as String?,
      phoneNumberId: json['phone_number_id'] as String?,
      web3WalletId: json['web3_wallet_id'] as String?,
      passkeyId: json['passkey_id'] as String?,
      isPrimary: json['primary'] as bool? ?? false,
      isDefault: json['default'] as bool? ?? false,
    );

Map<String, dynamic> _$FactorToJson(Factor instance) => <String, dynamic>{
      'strategy': instance.strategy.toJson(),
      if (instance.safeIdentifier case final value?) 'safe_identifier': value,
      if (instance.emailAddressId case final value?) 'email_address_id': value,
      if (instance.phoneNumberId case final value?) 'phone_number_id': value,
      if (instance.web3WalletId case final value?) 'web3_wallet_id': value,
      if (instance.passkeyId case final value?) 'passkey_id': value,
      'primary': instance.isPrimary,
      'default': instance.isDefault,
    };
