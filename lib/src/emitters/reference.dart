part of emitter;

/// {@template reference_emitter}
/// Transforms the [Reference] element into Dart source code.
/// {@endtemplate}
class ReferenceEmitter extends Emitter<Reference> {
  /// {@macro reference_emitter}
  const ReferenceEmitter(super.context);

  @override
  StringSink emit(
    Reference element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    if (element is TypeReference) {
      TypeReferenceEmitter(context).emit(element, output);
    } //
    else if (element is FunctionReference) {
      FunctionReferenceEmitter(context).emit(element, output);
    }

    return output;
  }
}

/// {@template type_reference_emitter}
/// Transforms the [TypeReference] element into Dart source code.
/// {@endtemplate}
class TypeReferenceEmitter extends Emitter<TypeReference> {
  /// {@macro type_reference_emitter}
  const TypeReferenceEmitter(super.context);

  @override
  StringSink emit(
    TypeReference element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    // Register the reference to be imported.
    final prefix = context.importer.register(element);

    if (prefix != null) {
      output.write('$prefix.');
    }

    output.write(element.symbol);

    if (element.types.isNotEmpty) {
      output.write('<');

      var index = 0;

      for (final v in element.types) {
        ReferenceEmitter(context).emit(v, output);

        index++;

        if (index < element.types.length) {
          output.write(',');
        }
      }

      output.write('>');
    }

    if (element.isNullable) {
      output.write('?');
    }

    return output;
  }
}

/// {@template function_reference_emitter}
/// Transforms the [FunctionReference] element into Dart source code.
/// {@endtemplate}
class FunctionReferenceEmitter extends Emitter<FunctionReference> {
  /// {@macro function_reference_emitter}
  const FunctionReferenceEmitter(super.context);

  @override
  StringSink emit(
    FunctionReference element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    ReferenceEmitter(context).emit(element.returns, output);

    output.write(' Function(');

    ParameterListEmitter(context).emit(element.parameters, output);

    output.write(')');

    return output;
  }
}
