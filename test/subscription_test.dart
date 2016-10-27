library subscription_test;

import 'package:test/test.dart';

import 'package:event_system/event_system.dart';

class TestSubscriptionObject extends Object with SubscriptionMixin {}

main() async {
  TestSubscriptionObject firstTestObject;
  TestSubscriptionObject secondTestObject;
  setUpAll(() {
    firstTestObject = new TestSubscriptionObject();
    secondTestObject = new TestSubscriptionObject();
  });

  group('SubscriptionMixin', () {
    test('can subscribe on object', () {
      expect(secondTestObject.observers, isNotNull);

      secondTestObject.subscribe(firstTestObject);
      expect(secondTestObject.observers.contains(firstTestObject), isTrue);
      expect(firstTestObject.observables.contains(secondTestObject), isTrue);
    });

    test('can unsubscribe', () {
      secondTestObject.subscribe(firstTestObject);
      expect(secondTestObject.observers.contains(firstTestObject), isTrue);
      expect(firstTestObject.observables.contains(secondTestObject), isTrue);

      secondTestObject.unSubscribe(firstTestObject);
      expect(!secondTestObject.observers.contains(firstTestObject), isTrue);
      expect(!firstTestObject.observables.contains(secondTestObject), isTrue);
    });
  });
}
