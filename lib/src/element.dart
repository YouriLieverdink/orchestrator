library element;

import 'package:equatable/equatable.dart';
import 'package:orchestrator/orchestrator.dart';

part './elements/annotation.dart';
part './elements/class.dart';
part './elements/column.dart';
part './elements/constructor.dart';
part './elements/directive.dart';
part './elements/docs.dart';
part './elements/enum.dart';
part './elements/extension.dart';
part './elements/field.dart';
part './elements/for.dart';
part './elements/if.dart';
part './elements/invoke.dart';
part './elements/library.dart';
part './elements/literal.dart';
part './elements/loop.dart';
part './elements/method.dart';
part './elements/mixin.dart';
part './elements/parameter.dart';
part './elements/reference.dart';
part './elements/row.dart';
part './elements/static.dart';
part './elements/switch.dart';
part './elements/try_catch.dart';
part './elements/while.dart';

/// {@template element}
/// Represents an enclosed piece of source code like a class, enum, or field.
///
/// The [Element]s are the building blocks of the source code which needs to
/// be generated. Every [Element] has at least one [Emitter] that transforms
/// its configuration into source code.
/// {@endtemplate}
abstract class Element extends Equatable {
  /// {@macro element}
  const Element();
}
