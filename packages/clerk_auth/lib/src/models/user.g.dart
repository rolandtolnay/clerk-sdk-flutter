// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      profileImageUrl: json['profile_image_url'] as String?,
      imageUrl: json['image_url'] as String?,
      hasImage: json['has_image'] as bool?,
      primaryEmailAddressId: json['primary_email_address_id'] as String?,
      primaryPhoneNumberId: json['primary_phone_number_id'] as String?,
      primaryWeb3WalletId: json['primary_web3_wallet_id'] as String?,
      publicMetadata: json['public_metadata'] as Map<String, dynamic>?,
      privateMetadata: json['private_metadata'] as Map<String, dynamic>?,
      unsafeMetadata: json['unsafe_metadata'] as Map<String, dynamic>?,
      emailAddresses: (json['email_addresses'] as List<dynamic>?)
          ?.map((e) => Email.fromJson(e as Map<String, dynamic>))
          .toList(),
      phoneNumbers: (json['phone_numbers'] as List<dynamic>?)
          ?.map((e) => PhoneNumber.fromJson(e as Map<String, dynamic>))
          .toList(),
      web3Wallets: (json['web3_wallets'] as List<dynamic>?)
          ?.map((e) => Web3Wallet.fromJson(e as Map<String, dynamic>))
          .toList(),
      passkeys: (json['passkeys'] as List<dynamic>?)
          ?.map((e) => Passkey.fromJson(e as Map<String, dynamic>))
          .toList(),
      organizationMemberships: (json['organization_memberships']
              as List<dynamic>?)
          ?.map(
              (e) => OrganizationMembership.fromJson(e as Map<String, dynamic>))
          .toList(),
      passwordEnabled: json['password_enabled'] as bool?,
      twoFactorEnabled: json['two_factor_enabled'] as bool?,
      totpEnabled: json['totp_enabled'] as bool?,
      backupCodeEnabled: json['backup_code_enabled'] as bool?,
      lastSignInAt: intToDateTime(json['last_sign_in_at']),
      banned: json['banned'] as bool?,
      locked: json['locked'] as bool?,
      lockoutExpiresInSeconds:
          (json['lockout_expires_in_seconds'] as num?)?.toInt(),
      verificationAttemptsRemaining:
          (json['verification_attempts_remaining'] as num?)?.toInt(),
      updatedAt: intToDateTime(json['updated_at']),
      createdAt: intToDateTime(json['created_at']),
      lastActiveAt: intToDateTime(json['last_active_at']),
      deleteSelfEnabled: json['delete_self_enabled'] as bool?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      if (instance.firstName case final value?) 'first_name': value,
      if (instance.lastName case final value?) 'last_name': value,
      if (instance.profileImageUrl case final value?)
        'profile_image_url': value,
      if (instance.imageUrl case final value?) 'image_url': value,
      if (instance.hasImage case final value?) 'has_image': value,
      if (instance.primaryEmailAddressId case final value?)
        'primary_email_address_id': value,
      if (instance.primaryPhoneNumberId case final value?)
        'primary_phone_number_id': value,
      if (instance.primaryWeb3WalletId case final value?)
        'primary_web3_wallet_id': value,
      if (instance.publicMetadata case final value?) 'public_metadata': value,
      if (instance.privateMetadata case final value?) 'private_metadata': value,
      if (instance.unsafeMetadata case final value?) 'unsafe_metadata': value,
      if (instance.emailAddresses?.map((e) => e.toJson()).toList()
          case final value?)
        'email_addresses': value,
      if (instance.phoneNumbers?.map((e) => e.toJson()).toList()
          case final value?)
        'phone_numbers': value,
      if (instance.web3Wallets?.map((e) => e.toJson()).toList()
          case final value?)
        'web3_wallets': value,
      if (instance.passkeys?.map((e) => e.toJson()).toList() case final value?)
        'passkeys': value,
      if (instance.organizationMemberships?.map((e) => e.toJson()).toList()
          case final value?)
        'organization_memberships': value,
      if (instance.passwordEnabled case final value?) 'password_enabled': value,
      if (instance.twoFactorEnabled case final value?)
        'two_factor_enabled': value,
      if (instance.totpEnabled case final value?) 'totp_enabled': value,
      if (instance.backupCodeEnabled case final value?)
        'backup_code_enabled': value,
      if (instance.banned case final value?) 'banned': value,
      if (instance.locked case final value?) 'locked': value,
      if (instance.lockoutExpiresInSeconds case final value?)
        'lockout_expires_in_seconds': value,
      if (instance.verificationAttemptsRemaining case final value?)
        'verification_attempts_remaining': value,
      if (instance.deleteSelfEnabled case final value?)
        'delete_self_enabled': value,
      if (instance.lastSignInAt?.toIso8601String() case final value?)
        'last_sign_in_at': value,
      if (instance.updatedAt?.toIso8601String() case final value?)
        'updated_at': value,
      if (instance.createdAt?.toIso8601String() case final value?)
        'created_at': value,
      if (instance.lastActiveAt?.toIso8601String() case final value?)
        'last_active_at': value,
    };
