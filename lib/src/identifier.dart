import 'package:license_identifier/src/license_loader.dart';
import 'package:license_identifier/src/matcher.dart';
import 'package:license_identifier/src/normalizer.dart';

class Match {
  final LicenseTemplate license;
  final double score;

  Match(this.license, this.score);
}

List<Match> identify_license(
  String document, {
  Normalizer normalizer = default_normalizer,
  Matcher matcher = default_matcher,
  double threshold = 0.97,
  String data_folder = 'data',
}) {
  document = normalizer.normalize(document);
  var result = <Match>[];
  var candidates = load_templates(data_folder);
  for (var candidate in candidates) {
    var template = normalizer.normalize(candidate.text);
    var score = matcher.calc_score(document, template);
    if (score < threshold) continue;
    result.add(Match(candidate, score));
  }
  result.sort((a, b) => b.score.compareTo(a.score));
  return result;
}
