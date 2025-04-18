// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUp _$SignUpFromJson(Map<String, dynamic> json) => SignUp(
      id: json['id'] as String,
      status: Status.fromJson(json['status'] as String),
      requiredFields: (json['required_fields'] as List<dynamic>)
          .map((e) => Field.fromJson(e as String))
          .toList(),
      optionalFields: (json['optional_fields'] as List<dynamic>)
          .map((e) => Field.fromJson(e as String))
          .toList(),
      missingFields: (json['missing_fields'] as List<dynamic>)
          .map((e) => Field.fromJson(e as String))
          .toList(),
      unverifiedFields: (json['unverified_fields'] as List<dynamic>)
          .map((e) => Field.fromJson(e as String))
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
      verifications: _toFieldVerificationMap(json['verifications']),
      customAction: json['custom_action'] as bool,
      externalId: json['external_id'] as String?,
      createdSessionId: json['created_session_id'] as String?,
      createdUserId: json['created_user_id'] as String?,
      abandonAt: intToDateTime(json['abandon_at']),
    );

Map<String, dynamic> _$SignUpToJson(SignUp instance) => <String, dynamic>{
      'id': instance.id,
      'status': instance.status.toJson(),
      'required_fields':
          instance.requiredFields.map((e) => e.toJson()).toList(),
      'optional_fields':
          instance.optionalFields.map((e) => e.toJson()).toList(),
      'missing_fields': instance.missingFields.map((e) => e.toJson()).toList(),
      'unverified_fields':
          instance.unverifiedFields.map((e) => e.toJson()).toList(),
      if (instance.username case final value?) 'username': value,
      if (instance.emailAddress case final value?) 'email_address': value,
      if (instance.phoneNumber case final value?) 'phone_number': value,
      if (instance.web3Wallet case final value?) 'web3_wallet': value,
      'password_enabled': instance.passwordEnabled,
      if (instance.firstName case final value?) 'first_name': value,
      if (instance.lastName case final value?) 'last_name': value,
      'unsafe_metadata': instance.unsafeMetadata,
      'public_metadata': instance.publicMetadata,
      'verifications': _fromFieldVerificationMap(instance.verifications),
      'custom_action': instance.customAction,
      if (instance.externalId case final value?) 'external_id': value,
      if (instance.createdSessionId case final value?)
        'created_session_id': value,
      if (instance.createdUserId case final value?) 'created_user_id': value,
      'abandon_at': dateTimeToInt(instance.abandonAt),
    };
