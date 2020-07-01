### Definition

`Mediator` reduces the dependencies between the group of objects(`colleagues`). Objects should talk with each other only via `mediator` object.

![img](https://refactoring.guru/images/patterns/diagrams/mediator/live-example-2x.png)

Pilots should not talk to each other when deciding who should land when. All communication goes through the control tower.

### Vocabulary
- `Colleague`: contains a piece of business logic. Must not be aware of other components
- `Mediator`: declares communication interface.
- `ConcreteMediator`: encapsulates relations between various `colleagues`.

### Questions
- Do we need `react_on` methods?
- Do we need `notify` method?


### Links
- https://refactoring.guru/design-patterns/mediator
- https://medium.com/@dljerome/design-patterns-in-ruby-mediator-169e77710e37
