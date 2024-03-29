part of emitter;

/// {@template parameter_emitter}
/// Transforms the [Parameter] element into Dart source code.
/// {@endtemplate}
class ParameterEmitter extends Emitter<Parameter> {
  /// {@macro parameter_emitter}
  const ParameterEmitter(super.context);

  @override
  StringSink emit(
    Parameter element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    for (final v in element.annotations) {
      AnnotationEmitter(context).emit(v, output);

      output.write('\n');
    }

    if (element.kind == ParameterKind.named && element.isRequired) {
      output.write('required ');
    }

    if (element.isToThis) {
      output.write('this.');
    } //
    else if (element.isToSuper) {
      output.write('super.');
    } //
    else if (element.type != null) {
      ReferenceEmitter(context).emit(element.type!, output);

      output.write(' ');
    }

    output.write(element.name);

    if (element.assign != null) {
      output.write(' = ');

      ElementEmitter(context).emit(element.assign!, output);
    }

    return output;
  }
}

/// {@template parameter_list_emitter}
/// Transforms a list of the [Parameter] element into Dart source code.
/// {@endtemplate}
class ParameterListEmitter extends Emitter<Iterable<Parameter>> {
  /// {@macro parameter_list_emitter}
  const ParameterListEmitter(super.context);

  T? valueAtOrNull<T>(Iterable<T> values, int index) {
    try {
      return values.elementAt(index);
    } //
    catch (_) {
      return null;
    }
  }

  bool useTraillingCommas(
    Iterable<Parameter> elements,
  ) {
    return context.useTraillingCommas && elements.length > 1;
  }

  @override
  StringSink emit(
    Iterable<Parameter> elements, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    for (int i = 0; i < elements.length; i++) {
      //
      final prev = valueAtOrNull(elements, i - 1);
      final curr = elements.elementAt(i);
      final next = valueAtOrNull(elements, i + 1);

      if (curr.kind != null && (prev == null || !(prev.kind != null))) {
        output.write(curr.kind == ParameterKind.named ? '{' : '[');
      }

      ParameterEmitter(context).emit(curr, output);

      if (i < elements.length - 1 || useTraillingCommas(elements)) {
        output.write(', ');
      }

      if (curr.kind != null && (next == null || !(next.kind != null))) {
        output.write(curr.kind == ParameterKind.named ? '}' : ']');
      }
    }

    return output;
  }
}
