import 'package:license_identifier/src/tokenizer.dart';

abstract class Matcher {
  const Matcher();
  double calc_score(String text1, String text2);
}

class DiceCoeffMatcher extends Matcher {
  final Tokenizer tokenizer;

  const DiceCoeffMatcher({this.tokenizer = default_tokenizer});

  @override
  double calc_score(String text1, String text2) {
    var ws1 = tokenizer.tokenize(text1).toSet();
    var ws2 = tokenizer.tokenize(text2).toSet();
    var sum = ws1.length + ws2.length;
    var intersection = ws1.intersection(ws2).length;
    return 2.0 * intersection / sum;
  }
}

const default_matcher = DiceCoeffMatcher();

double calc_score(String text1, String text2) {
  return default_matcher.calc_score(text1, text2);
}
