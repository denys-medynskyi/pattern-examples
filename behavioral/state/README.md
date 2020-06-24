### Definition

State is a pattern that lets an object to change its behavior when its internal page changes. It appears like object changed its class.

Suggests you to create a new class for all possible states of an object and extract all state-specific behaviors into these classes.

![problem](https://refactoring.guru/images/patterns/diagrams/state/problem2-en-2x.png)

![diagram](https://refactoring.guru/images/patterns/diagrams/state/solution-en-2x.png)


### Vocabulary
`Context`:
- knows current state
- has access to concrete state

`State`:
- declares state-specific methods

`Concrete States`:
- inherits from `State`
- provide own implementation of state-specific methods
- can trigger transition to other state



### Links

- https://refactoring.guru/design-patterns/state
