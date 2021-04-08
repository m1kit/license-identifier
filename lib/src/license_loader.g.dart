// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'license_loader.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LicenseTOC _$_LicenseTOCFromJson(Map<String, dynamic> json) {
  return _LicenseTOC(
    licenseListVersion: json['licenseListVersion'] as String,
    licenses: (json['licenses'] as List<dynamic>)
        .map((e) => _LicenseTOCEntry.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_LicenseTOCToJson(_LicenseTOC instance) =>
    <String, dynamic>{
      'licenseListVersion': instance.licenseListVersion,
      'licenses': instance.licenses,
    };

_LicenseTOCEntry _$_LicenseTOCEntryFromJson(Map<String, dynamic> json) {
  return _LicenseTOCEntry(
    licenseId: json['licenseId'] as String,
    name: json['name'] as String,
    detailsUrl: json['detailsUrl'] as String,
    reference: json['reference'] as String,
    isDeprecatedLicenseId: json['isDeprecatedLicenseId'] as bool,
    isOsiApproved: json['isOsiApproved'] as bool,
    referenceNumber: json['referenceNumber'] as int,
    seeAlso:
        (json['seeAlso'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$_LicenseTOCEntryToJson(_LicenseTOCEntry instance) =>
    <String, dynamic>{
      'licenseId': instance.licenseId,
      'name': instance.name,
      'detailsUrl': instance.detailsUrl,
      'reference': instance.reference,
      'isDeprecatedLicenseId': instance.isDeprecatedLicenseId,
      'isOsiApproved': instance.isOsiApproved,
      'referenceNumber': instance.referenceNumber,
      'seeAlso': instance.seeAlso,
    };

_LicenseInfo _$_LicenseInfoFromJson(Map<String, dynamic> json) {
  return _LicenseInfo(
    licenseId: json['licenseId'] as String,
    name: json['name'] as String,
    licenseText: json['licenseText'] as String,
    licenseTextHtml: json['licenseTextHtml'] as String,
    standardLicenseTemplate: json['standardLicenseTemplate'] as String,
    isDeprecatedLicenseId: json['isDeprecatedLicenseId'] as bool,
    isOsiApproved: json['isOsiApproved'] as bool,
    seeAlso:
        (json['seeAlso'] as List<dynamic>).map((e) => e as String).toList(),
    crossRef: (json['crossRef'] as List<dynamic>)
        .map((e) =>
            _LicenseInfoCrossRefEntry.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_LicenseInfoToJson(_LicenseInfo instance) =>
    <String, dynamic>{
      'licenseId': instance.licenseId,
      'name': instance.name,
      'licenseText': instance.licenseText,
      'licenseTextHtml': instance.licenseTextHtml,
      'standardLicenseTemplate': instance.standardLicenseTemplate,
      'isDeprecatedLicenseId': instance.isDeprecatedLicenseId,
      'isOsiApproved': instance.isOsiApproved,
      'seeAlso': instance.seeAlso,
      'crossRef': instance.crossRef,
    };

_LicenseInfoCrossRefEntry _$_LicenseInfoCrossRefEntryFromJson(
    Map<String, dynamic> json) {
  return _LicenseInfoCrossRefEntry(
    match: json['match'] as String,
    url: json['url'] as String,
    isValid: json['isValid'] as bool,
    isLive: json['isLive'] as bool,
    timestamp: json['timestamp'] as String,
    isWayBackLink: json['isWayBackLink'] as bool,
    order: json['order'] as int,
  );
}

Map<String, dynamic> _$_LicenseInfoCrossRefEntryToJson(
        _LicenseInfoCrossRefEntry instance) =>
    <String, dynamic>{
      'match': instance.match,
      'url': instance.url,
      'isValid': instance.isValid,
      'isLive': instance.isLive,
      'timestamp': instance.timestamp,
      'isWayBackLink': instance.isWayBackLink,
      'order': instance.order,
    };
