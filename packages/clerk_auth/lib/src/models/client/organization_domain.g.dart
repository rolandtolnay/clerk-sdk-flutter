// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_domain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrganizationDomain _$OrganizationDomainFromJson(Map<String, dynamic> json) =>
    OrganizationDomain(
      id: json['id'] as String,
      orgId: json['organization_id'] as String,
      name: json['name'] as String,
      enrollmentMode:
          $enumDecode(_$EnrollmentModeEnumMap, json['enrollment_mode']),
      affiliationEmailAddress: json['affiliation_email_address'] as String?,
      verification: json['verification'] == null
          ? null
          : Verification.fromJson(json['verification'] as Map<String, dynamic>),
      totalPendingInvitations:
          (json['total_pending_invitations'] as num).toInt(),
      totalPendingSuggestions:
          (json['total_pending_suggestions'] as num).toInt(),
      updatedAt: intToDateTime(json['updated_at']),
      createdAt: intToDateTime(json['created_at']),
    );

Map<String, dynamic> _$OrganizationDomainToJson(OrganizationDomain instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organization_id': instance.orgId,
      'name': instance.name,
      'enrollment_mode': _$EnrollmentModeEnumMap[instance.enrollmentMode]!,
      if (instance.affiliationEmailAddress case final value?)
        'affiliation_email_address': value,
      if (instance.verification?.toJson() case final value?)
        'verification': value,
      'total_pending_invitations': instance.totalPendingInvitations,
      'total_pending_suggestions': instance.totalPendingSuggestions,
      'updated_at': dateTimeToInt(instance.updatedAt),
      'created_at': dateTimeToInt(instance.createdAt),
    };

const _$EnrollmentModeEnumMap = {
  EnrollmentMode.automaticSuggestion: 'automatic_suggestion',
  EnrollmentMode.automaticInvitation: 'automatic_invitation',
  EnrollmentMode.manualInvitation: 'manual_invitation',
};
