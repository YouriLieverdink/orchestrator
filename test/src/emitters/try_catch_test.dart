import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const context = Context();
  const emitter = TryCatchEmitter(context);

  group(
    'TryCatchEmitter',
    () {
      test(
        'should emit a try-catch block',
        () {
          const element = TryCatch(
            try_: Column([
              Static('cat.pickUp();'),
            ]),
            catch_: Column([
              Static('print("ouch!");'),
            ]),
          );

          Expect(
            element,
            const Equals(
              '''
                try {
                  cat.pickUp();
                } catch (e) {
                  print("ouch!");
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a try-catch block with finally',
        () {
          const element = TryCatch(
            try_: Column([
              Static('cat.pickUp();'),
            ]),
            catch_: Column([
              Static('print("ouch!");'),
            ]),
            finally_: Column([
              Static('// You never know what happens!'),
            ]),
          );

          Expect(
            element,
            const Equals(
              '''
                try {
                  cat.pickUp();
                } catch (e) {
                  print("ouch!");
                } finally {
                  // You never know what happens!
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );
}
