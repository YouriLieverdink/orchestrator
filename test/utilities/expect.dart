import 'package:coder/coder.dart';
import 'package:test/test.dart';

import './utilities.dart';

void cExpect(
  Element item,
  Equals matcher,
) {
  Expect(item, matcher);
}

/// {@template expect}
///
/// {@endtemplate}
class Expect {
  /// {@macro expect}
  Expect(
    Element item,
    Equals matcher,
  ) {
    //
    if (matcher.matches(item, {})) return;

    // Prepare a Buffer which holds the error description.
    final output = StringBuffer();

    final expected = format(matcher.expected);
    final actual = format('${matcher.emitter.emit(item)}');

    // We use the matchers mismatch description to describe the exact location.
    final description = StringDescription();
    matcher.describeMismatch(item, description, {}, false);

    output //
      ..writeln(indent(expected, first: 'Expected: '))
      ..writeln(indent(actual, first: '  Actual: '))
      ..writeln(indent('$description', first: '   Which: '));

    throw TestFailure('$output');
  }
}