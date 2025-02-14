// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'external_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExternalAccount _$ExternalAccountFromJson(Map<String, dynamic> json) =>
    ExternalAccount(
      id: json['id'] as String,
      provider: json['provider'] as String,
      providerUserId: json['provider_user_id'] as String,
      approvedScopes: json['approved_scopes'] as String,
      emailAddress: json['email_address'] as String,
      username: json['username'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      imageUrl: json['image_url'] as String?,
      label: json['label'] as String?,
      publicMetadata: json['public_metadata'] as Map<String, dynamic>?,
      verification:
          Verification.fromJson(json['verification'] as Map<String, dynamic>),
      updatedAt: intToDateTime(json['updated_at']),
      createdAt: intToDateTime(json['created_at']),
    );

Map<String, dynamic> _$ExternalAccountToJson(ExternalAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'provider': instance.provider,
      'provider_user_id': instance.providerUserId,
      'approved_scopes': instance.approvedScopes,
      'email_address': instance.emailAddress,
      if (instance.username case final value?) 'username': value,
      if (instance.firstName case final value?) 'first_name': value,
      if (instance.lastName case final value?) 'last_name': value,
      if (instance.avatarUrl case final value?) 'avatar_url': value,
      if (instance.imageUrl case final value?) 'image_url': value,
      if (instance.label case final value?) 'label': value,
      if (instance.publicMetadata case final value?) 'public_metadata': value,
      'verification': instance.verification.toJson(),
      'updated_at': dateTimeToInt(instance.updatedAt),
      'created_at': dateTimeToInt(instance.createdAt),
    };
