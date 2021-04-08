import 'dart:io';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:path/path.dart' as p;

part 'license_loader.g.dart';

/// Load a list of licenses from https://spdx.org/licenses/licenses.json .
List<LicenseTemplate> load_templates([String data_folder = 'data']) {
  var license_toc_filename = p.join(data_folder, 'licenses.json');
  var toc_json = File(license_toc_filename).readAsStringSync();
  var toc = _LicenseTOC.fromJson(jsonDecode(toc_json));
  return toc.licenses.map((e) {
    var filename = p.join(data_folder, p.basename(e.reference));
    var json = File(filename).readAsStringSync();
    var license_info = _LicenseInfo.fromJson(jsonDecode(json));
    return license_info.toTemplate();
  }).toList(growable: false);
}

@JsonSerializable()
class _LicenseTOC {
  final String licenseListVersion;
  final List<_LicenseTOCEntry> licenses;

  const _LicenseTOC({
    required this.licenseListVersion,
    required this.licenses,
  });

  factory _LicenseTOC.fromJson(Map<String, dynamic> json) =>
      _$_LicenseTOCFromJson(json);

  Map<String, dynamic> toJson() => _$_LicenseTOCToJson(this);
}

@JsonSerializable()
class _LicenseTOCEntry {
  final String licenseId;
  final String name;
  final String detailsUrl;
  final String reference;
  final bool isDeprecatedLicenseId;
  final bool isOsiApproved;
  final int referenceNumber;
  final List<String> seeAlso;

  const _LicenseTOCEntry({
    required this.licenseId,
    required this.name,
    required this.detailsUrl,
    required this.reference,
    required this.isDeprecatedLicenseId,
    required this.isOsiApproved,
    required this.referenceNumber,
    required this.seeAlso,
  });

  factory _LicenseTOCEntry.fromJson(Map<String, dynamic> json) =>
      _$_LicenseTOCEntryFromJson(json);

  Map<String, dynamic> toJson() => _$_LicenseTOCEntryToJson(this);
}

@JsonSerializable()
class _LicenseInfo {
  final String licenseId;
  final String name;
  final String licenseText;
  final String licenseTextHtml;
  final String standardLicenseTemplate;
  final bool isDeprecatedLicenseId;
  final bool isOsiApproved;
  final List<String> seeAlso;
  final List<_LicenseInfoCrossRefEntry> crossRef;

  const _LicenseInfo({
    required this.licenseId,
    required this.name,
    required this.licenseText,
    required this.licenseTextHtml,
    required this.standardLicenseTemplate,
    required this.isDeprecatedLicenseId,
    required this.isOsiApproved,
    required this.seeAlso,
    required this.crossRef,
  });

  LicenseTemplate toTemplate() {
    return LicenseTemplate(id: licenseId, name: name, text: licenseText);
  }

  factory _LicenseInfo.fromJson(Map<String, dynamic> json) =>
      _$_LicenseInfoFromJson(json);

  Map<String, dynamic> toJson() => _$_LicenseInfoToJson(this);
}

@JsonSerializable()
class _LicenseInfoCrossRefEntry {
  final String match;
  final String url;
  final bool isValid;
  final bool isLive;
  final String timestamp;
  final bool isWayBackLink;
  final int order;

  const _LicenseInfoCrossRefEntry({
    required this.match,
    required this.url,
    required this.isValid,
    required this.isLive,
    required this.timestamp,
    required this.isWayBackLink,
    required this.order,
  });

  factory _LicenseInfoCrossRefEntry.fromJson(Map<String, dynamic> json) =>
      _$_LicenseInfoCrossRefEntryFromJson(json);

  Map<String, dynamic> toJson() => _$_LicenseInfoCrossRefEntryToJson(this);
}

class LicenseTemplate {
  final String id;
  final String name;
  final String text;

  const LicenseTemplate({
    required this.id,
    required this.name,
    required this.text,
  });
}
