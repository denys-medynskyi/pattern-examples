### Definition

Subclasses should add to a base class behavior, not replace it.

### Violations

The modification of the other instance method is an unexpected consequence.

Another common instance of a Liskov violation is raising an exception for an overridden method in a child class.

It’s also not uncommon to see methods overridden with modified method signatures causing branching on type in classes that depend on objects of the parent’s type.

All of these either lead to unstable code or unnecessary and ugly branching.
