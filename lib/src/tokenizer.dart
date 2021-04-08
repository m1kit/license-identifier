abstract class Tokenizer {
  const Tokenizer();
  List<String> tokenize(String text);
}

// By default, we assume that words are separated by spaces,
// but this may not be appropriate for some documents
// that are not written in English.
class EnglishTokenizer extends Tokenizer {
  const EnglishTokenizer();

  @override
  List<String> tokenize(String text) {
    return text.split(' ');
  }
}

const default_tokenizer = EnglishTokenizer();

/// Decompose a document into words.
List<String> tokenize(String text) {
  return default_tokenizer.tokenize(text);
}
