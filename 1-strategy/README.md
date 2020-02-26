# Strategy

- defines a family of algorithms,
- encapsulates each algorithm
- makes the algorithms interchangeable within that family

### The main idea of Strategy pattern

to define set of objects (strategies) which solve the same problem in different way, depending on conditions.

### Code smell
If you see that your code contains a lot of if..else or case..when, check that code twice, there might be a chance that you're missing Strategy pattern there.
