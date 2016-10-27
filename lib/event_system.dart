library event_system;

import 'dart:async';

//Mixins
part 'src/notify_mixin.dart';
part 'src/observable_mixin.dart';
part 'src/subscription_mixin.dart';

class EventSystem extends Object
    with NotifyMixin, ObservableMixin, SubscriptionMixin {
  StreamController controller;
  Stream stream;

  EventSystem() {
    controller = new StreamController();
    stream = controller.stream.asBroadcastStream();
  }
}
