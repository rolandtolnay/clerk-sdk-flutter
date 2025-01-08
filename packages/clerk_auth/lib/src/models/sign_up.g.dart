// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUp _$SignUpFromJson(Map<String, dynamic> json) => SignUp(
      id: json['id'] as String,
      status: $enumDecode(_$StatusEnumMap, json['status']),
      requiredFields: (json['required_fields'] as List<dynamic>)
          .map((e) => $enumDecode(_$FieldEnumMap, e))
          .toList(),
      optionalFields: (json['optional_fields'] as List<dynamic>)
          .map((e) => $enumDecode(_$FieldEnumMap, e))
          .toList(),
      missingFields: (json['missing_fields'] as List<dynamic>)
          .map((e) => $enumDecode(_$FieldEnumMap, e))
          .toList(),
      unverifiedFields: (json['unverified_fields'] as List<dynamic>)
          .map((e) => $enumDecode(_$FieldEnumMap, e))
          .toList(),
      username: json['username'] as String?,
      emailAddress: json['email_address'] as String?,
      phoneNumber: json['phone_number'] as String?,
      web3Wallet: json['web3_wallet'] as String?,
      passwordEnabled: json['password_enabled'] as bool,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      unsafeMetadata: json['unsafe_metadata'] as Map<String, dynamic>,
      publicMetadata: json['public_metadata'] as Map<String, dynamic>,
      customAction: json['custom_action'] as bool,
      externalId: json['external_id'] as String?,
      createdSessionId: json['created_session_id'] as String?,
      createdUserId: json['created_user_id'] as String?,
      abandonAt: intToDateTime(json['abandon_at']),
    );

Map<String, dynamic> _$SignUpToJson(SignUp instance) => <String, dynamic>{
      'id': instance.id,
      'status': _$StatusEnumMap[instance.status]!,
      'required_fields':
          instance.requiredFields.map((e) => _$FieldEnumMap[e]!).toList(),
      'optional_fields':
          instance.optionalFields.map((e) => _$FieldEnumMap[e]!).toList(),
      'missing_fields':
          instance.missingFields.map((e) => _$FieldEnumMap[e]!).toList(),
      'unverified_fields':
          instance.unverifiedFields.map((e) => _$FieldEnumMap[e]!).toList(),
      if (instance.username case final value?) 'username': value,
      if (instance.emailAddress case final value?) 'email_address': value,
      if (instance.phoneNumber case final value?) 'phone_number': value,
      if (instance.web3Wallet case final value?) 'web3_wallet': value,
      'password_enabled': instance.passwordEnabled,
      if (instance.firstName case final value?) 'first_name': value,
      if (instance.lastName case final value?) 'last_name': value,
      'unsafe_metadata': instance.unsafeMetadata,
      'public_metadata': instance.publicMetadata,
      'custom_action': instance.customAction,
      if (instance.externalId case final value?) 'external_id': value,
      if (instance.createdSessionId case final value?)
        'created_session_id': value,
      if (instance.createdUserId case final value?) 'created_user_id': value,
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

const _$FieldEnumMap = {
  Field.emailAddress: 'email_address',
  Field.externalAccount: 'external_account',
  Field.firstName: 'first_name',
  Field.lastName: 'last_name',
  Field.password: 'password',
  Field.phoneNumber: 'phone_number',
  Field.oauthApple: 'oauth_apple',
  Field.oauthGithub: 'oauth_github',
  Field.oauthGoogle: 'oauth_google',
  Field.username: 'username',
  Field.web3Wallet: 'web3_wallet',
  Field.code: 'code',
  Field.token: 'token',
  Field.signature: 'signature',
};
