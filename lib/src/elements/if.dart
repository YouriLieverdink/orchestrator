part of element;

/// {@template if}
/// Configuration for defining an if statement.
/// {@endtemplate}
class If extends Element {
  /// {@macro if}
  const If({
    required this.clauses,
    this.else_,
  });

  /// The clauses of this `if` statement.
  final Iterable<IfClause> clauses;

  /// The else block of this `if` statement.
  final Element? else_;

  @override
  List<Object?> get props => [clauses, else_];
}

/// {@template if_clause}
/// Configuration for defining an if statement clause.
/// {@endtemplate}
class IfClause extends Element {
  /// {@macro if}
  const IfClause({
    required this.condition,
    this.body,
  });

  /// The condition of this `if` clause.
  final Element condition;

  /// The body of this `if` clause.
  final Element? body;

  @override
  List<Object?> get props {
    return [condition, body];
  }
}
