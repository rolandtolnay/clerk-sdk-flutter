// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_membership.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrganizationMembership _$OrganizationMembershipFromJson(
        Map<String, dynamic> json) =>
    OrganizationMembership(
      id: json['id'] as String,
      role: json['role'] as String,
      roleName: json['role_name'] as String,
      updatedAt: intToDateTime(json['updated_at']),
      createdAt: intToDateTime(json['created_at']),
      organization:
          Organization.fromJson(json['organization'] as Map<String, dynamic>),
      publicUserData: json['public_user_data'] == null
          ? null
          : UserPublic.fromJson(
              json['public_user_data'] as Map<String, dynamic>),
      permissions: _fromPermissionsList(json['permissions']),
    );

Map<String, dynamic> _$OrganizationMembershipToJson(
        OrganizationMembership instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'role_name': instance.roleName,
      'organization': instance.organization.toJson(),
      if (instance.publicUserData?.toJson() case final value?)
        'public_user_data': value,
      'permissions': instance.permissions.map((e) => e.toJson()).toList(),
      'updated_at': dateTimeToInt(instance.updatedAt),
      'created_at': dateTimeToInt(instance.createdAt),
    };
