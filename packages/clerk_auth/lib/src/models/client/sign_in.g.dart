// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignIn _$SignInFromJson(Map<String, dynamic> json) => SignIn(
      id: json['id'] as String,
      status: Status.fromJson(json['status'] as String),
      supportedIdentifiers: (json['supported_identifiers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      identifier: json['identifier'] as String?,
      userData: json['user_data'] == null
          ? null
          : UserPublic.fromJson(json['user_data'] as Map<String, dynamic>),
      supportedFirstFactors: (json['supported_first_factors'] as List<dynamic>?)
              ?.map((e) => Factor.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      firstFactorVerification: json['first_factor_verification'] == null
          ? null
          : Verification.fromJson(
              json['first_factor_verification'] as Map<String, dynamic>),
      supportedSecondFactors:
          (json['supported_second_factors'] as List<dynamic>?)
                  ?.map((e) => Factor.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
      secondFactorVerification: json['second_factor_verification'] == null
          ? null
          : Verification.fromJson(
              json['second_factor_verification'] as Map<String, dynamic>),
      createdSessionId: json['created_session_id'] as String?,
      abandonAt: intToDateTime(json['abandon_at']),
    );

Map<String, dynamic> _$SignInToJson(SignIn instance) => <String, dynamic>{
      'id': instance.id,
      'status': instance.status.toJson(),
      'supported_identifiers': instance.supportedIdentifiers,
      if (instance.identifier case final value?) 'identifier': value,
      if (instance.userData?.toJson() case final value?) 'user_data': value,
      if (instance.firstFactorVerification?.toJson() case final value?)
        'first_factor_verification': value,
      if (instance.secondFactorVerification?.toJson() case final value?)
        'second_factor_verification': value,
      if (instance.createdSessionId case final value?)
        'created_session_id': value,
      'abandon_at': dateTimeToInt(instance.abandonAt),
      'supported_first_factors':
          instance.supportedFirstFactors.map((e) => e.toJson()).toList(),
      'supported_second_factors':
          instance.supportedSecondFactors.map((e) => e.toJson()).toList(),
    };
