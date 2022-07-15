part of element;

/// {@template literal}
/// Configuration for defining a `literal` element.
/// {@endtemplate}
abstract class Literal<T> extends Element with Builder {
  /// {@macro literal}
  const Literal(
    this.value,
  );

  /// {@macro literal}
  static Literal of(dynamic value) {
    if (value is bool) {
      return LiteralBool(value);
    } //
    else if (value is List) {
      return LiteralList(value);
    } //
    else if (value is Map) {
      return LiteralMap(value);
    } //
    else if (value is num) {
      return LiteralNum(value);
    } //
    else if (value is String) {
      return LiteralString(value);
    } //
    else if (value == null) {
      return const LiteralNull();
    }

    throw UnsupportedError('');
  }

  /// The value of this literal.
  final T value;
}

/// {@template literal_bool}
/// Configuration for defining a literal `bool` element.
/// {@endtemplate}
class LiteralBool extends Literal<bool> {
  /// {@macro literal_bool}
  // ignore: avoid_positional_boolean_parameters
  const LiteralBool(super.value);

  @override
  LiteralBool copyWith({
    bool? value,
  }) {
    return LiteralBool(
      value ?? this.value,
    );
  }
}

/// {@template literal_list}
/// Configuration for defining a literal `list` element.
/// {@endtemplate}
class LiteralList extends Literal<List> {
  /// {@macro literal_list}
  const LiteralList(super.value);

  @override
  LiteralList copyWith({
    List? value,
  }) {
    return LiteralList(
      value ?? this.value,
    );
  }
}

/// {@template literal_map}
/// Configuration for defining a literal `map` element.
/// {@endtemplate}
class LiteralMap extends Literal<Map> {
  /// {@macro literal_map}
  const LiteralMap(super.value);

  @override
  LiteralMap copyWith({
    Map? value,
  }) {
    return LiteralMap(
      value ?? this.value,
    );
  }
}

/// {@template literal_null}
/// Configuration for defining a literal `null` element.
/// {@endtemplate}
class LiteralNull extends Literal<void> {
  /// {@macro literal_null}
  const LiteralNull() : super(null);

  @override
  LiteralNull copyWith() {
    return const LiteralNull();
  }
}

/// {@template literal_num}
/// Configuration for defining a literal `num` element.
/// {@endtemplate}
class LiteralNum extends Literal<num> {
  /// {@macro literal_num}
  const LiteralNum(super.value);

  @override
  LiteralNum copyWith({
    num? value,
  }) {
    return LiteralNum(
      value ?? this.value,
    );
  }
}

/// {@template literal_string}
/// Configuration for defining a literal `string` element.
/// {@endtemplate}
class LiteralString extends Literal<String> {
  /// {@macro literal_string}
  const LiteralString(super.value);

  @override
  LiteralString copyWith({
    String? value,
  }) {
    return LiteralString(
      value ?? this.value,
    );
  }
}
