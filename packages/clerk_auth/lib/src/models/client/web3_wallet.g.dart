// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web3_wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Web3Wallet _$Web3WalletFromJson(Map<String, dynamic> json) => Web3Wallet(
      id: json['id'] as String,
      verification: json['verification'] == null
          ? null
          : Verification.fromJson(json['verification'] as Map<String, dynamic>),
      web3Wallet: json['web3_wallet'] as String,
      updatedAt: intToDateTime(json['updated_at']),
      createdAt: intToDateTime(json['created_at']),
    );

Map<String, dynamic> _$Web3WalletToJson(Web3Wallet instance) =>
    <String, dynamic>{
      'id': instance.id,
      if (instance.verification?.toJson() case final value?)
        'verification': value,
      'web3_wallet': instance.web3Wallet,
      if (instance.updatedAt?.toIso8601String() case final value?)
        'updated_at': value,
      if (instance.createdAt?.toIso8601String() case final value?)
        'created_at': value,
    };
