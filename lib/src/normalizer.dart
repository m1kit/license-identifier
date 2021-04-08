abstract class Normalizer {
  const Normalizer();

  String normalize(String text);
}

class SequentialNormalizer extends Normalizer {
  final List<Normalizer> _normalizers;

  const SequentialNormalizer(this._normalizers);

  @override
  String normalize(String text) {
    for (var normalizer in _normalizers) {
      text = normalizer.normalize(text);
    }
    return text;
  }
}

// matching guideline, section 3
class BlankNormalizer extends Normalizer {
  static final RegExp pattern = RegExp(r'\s');

  const BlankNormalizer();

  @override
  String normalize(String text) {
    return text.replaceAll(pattern, ' ');
  }
}

// matching guideline, section 4
class CapitalizationNormalizer extends Normalizer {
  const CapitalizationNormalizer();

  @override
  String normalize(String text) {
    return text.toLowerCase();
  }
}

const default_normalizer = SequentialNormalizer([
  BlankNormalizer(),
  CapitalizationNormalizer(),
]);

/// Standardize the notational errors in documents.
String normalize(String text) {
  return default_normalizer.normalize(text);
}
