part of element;

/// {@template row}
/// Configuration for defining a row.
/// {@endtemplate}
class Row extends Element with Builder {
  /// {@macro row}
  const Row(
    this.elements,
  );

  /// {@macro row_binary}
  factory Row.binary({
    required Element left,
    required Element right,
    required String operator,
  }) {
    return Row([left, Static(' $operator '), right]);
  }

  /// The elements in this row.
  final Iterable<Element> elements;

  @override
  List<Object?> get props {
    return [elements];
  }
}
