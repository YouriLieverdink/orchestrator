import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../utilities/utilities.dart';

void main() {
  const context = Context();
  const emitter = ElementEmitter(context);

  test(
    'should emit the Dart variables sample',
    () {
      final element = Column([
        Literal.of('Voyager I') //
            .assignVar('name')
            .statement,
        Literal.of(1977) //
            .assignVar('year')
            .statement,
        Literal.of(3.7) //
            .assignVar('antennaDiameter')
            .statement,
        Literal.of(['Jupiter', 'Saturn', 'Uranus', 'Neptune'])
            .assignVar('flybyObjects')
            .statement,
        Literal.of({
          'tags': ['saturn'],
          'url': '//path/to/saturn.jpg'
        }).assignVar('image').statement,
      ]);

      Expect(
        element,
        const Equals(
          '''
            var name = 'Voyager I';
            var year = 1977;
            var antennaDiameter = 3.7;
            var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
            var image = {
              'tags': ['saturn'],
              'url': '//path/to/saturn.jpg'
            };
          ''',
          emitter: emitter,
        ),
      );
    },
  );
}
