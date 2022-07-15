import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../utilities/utilities.dart';

void main() {
  const context = Context();
  const emitter = ElementEmitter(context);

  test(
    'should emit the Dart hello world sample',
    () {
      final element = Method(
        name: 'main',
        body: const Static('print') //
            .invoke([Literal.of('Hello, World!')]) //
            .statement,
      );

      Expect(
        element,
        const Equals(
          '''
            void main() {
              print('Hello, World!');
            }
          ''',
          emitter: emitter,
        ),
      );
    },
  );
}
