### Definition


Bridge is
- structural pattern
- **WHEN**⏰: when class has several dimensions(shape / form)
- **HOW**🤔: 2 hierarchies: abscraction and implementation
- **WHY COOL**😎: hierarchies can be implemented independently
- **References**: composition over inheritance
- Implementation is granular
- Abscraction is concrete
- ![img](https://refactoring.guru/images/patterns/diagrams/bridge/structure-en-2x.png)

Solving problem with inheritance replacement with class composition.

### Problem

![img](https://refactoring.guru/images/patterns/diagrams/bridge/problem-en-2x.png)

### Solution

![img](https://refactoring.guru/images/patterns/diagrams/bridge/solution-en-2x.png)
![img](https://refactoring.guru/images/patterns/diagrams/bridge/example-en-2x.png)

### Abscraction
- high-level control layer
- does't do any work
- delegates to implementation(platform)

### Implementation
- declares common interface

### Links
- https://refactoring.guru/design-patterns/bridge
- https://simpleprogrammer.com/design-patterns-simplified-the-bridge-pattern/
