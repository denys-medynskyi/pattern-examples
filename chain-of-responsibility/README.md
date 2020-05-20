### Definition

Allows you to pass request through a chain of handlers.

Each handler:
- can pass request further
- can stop the execution chain
- contains logic for handling

![0-img](https://refactoring.guru/images/patterns/diagrams/chain-of-responsibility/structure-2x.png)

![img](https://refactoring.guru/images/patterns/content/chain-of-responsibility/chain-of-responsibility-2x.png)

![img-2](https://refactoring.guru/images/patterns/diagrams/chain-of-responsibility/solution1-en-2x.png)

![img-3](https://refactoring.guru/images/patterns/content/chain-of-responsibility/chain-of-responsibility-comic-1-en-2x.png)

### Applicability

- when your program is expected to process different kinds of requests in various ways, but the exact types of requests and their sequences are unknown beforehand.

- The pattern lets you link several handlers into one chain and, upon receiving a request, “ask” each handler whether it can process it. This way all handlers get a chance to process the request.

---

- when it’s essential to execute several handlers in a particular order.
- you can link handlers in any order

### Pros and Cons

+ You can control the order of request handling.
+ Single Responsibility Principle. You can decouple classes that invoke operations from classes that perform operations.
+ Open/Closed Principle. You can introduce new handlers into the app without breaking the existing client code.

---

- Some requests may end up unhandled

### Links
- https://refactoring.guru/design-patterns/chain-of-responsibility/ruby/example
- http://rubyblog.pro/2017/11/chain-of-responsibility-ruby
