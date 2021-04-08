import 'dart:io';
import 'package:license_identifier/license_identifier.dart'
    as license_identifier;

const data_folder_name = 'data';
const license_toc_filename = 'licenses.json';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    stderr.writeln('usage: ./license_identifier <LICENSE FILE> [threshold]');
    exit(1);
  }
  var text = File(arguments[0]).readAsStringSync();
  var threshold = arguments.length >= 2 ? double.parse(arguments[1]) : 0.97;
  var matches = license_identifier.identify_license(text, threshold: threshold);
  for (var match in matches) {
    print('${match.score.toStringAsFixed(3)} ${match.license.name}');
  }
}
