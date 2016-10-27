EventSystem
================

-	Stream for decouple many objects
-	Simple subscription on object events
-	Work both, on client and server

[![Build Status](https://travis-ci.org/Rasarts/AvalancheEvents.svg?branch=master)](https://travis-ci.org/Rasarts/AvalancheEvents)

```dart

library example_library;

import 'dart:async';

import 'package:event_system/event_system.dart';

/// Extend class
class BestClass extends EventSystem{}
/// Or extend Object with mixins
class OtherBestClass extends Object with NotifyMixin, ObservableMixin {}

void main() {
    BestClass bestClass = new BestClass();
    OtherBestClass otherBestClass = new OtherBestClass();

    bestClass.observable(otherBestClass);

    /// Just listen self stream
    otherBestClass.on('Event from bestClass', (bool eventData){
        print(eventData); // is true
    });

    bestClass.dispatchEvent('Event from bestClass', true);
}

```

Details
-------

*GRASP* - [wiki](https://en.wikipedia.org/wiki/GRASP) - *Low coupling* - [wiki](https://en.wikipedia.org/wiki/GRASP#Low_coupling)

*Observer Design Pattern* - [sourcemaking](https://sourcemaking.com/design_patterns/observer)

*Mediator Design Pattern* - [sourcemaking](https://sourcemaking.com/design_patterns/mediator)
