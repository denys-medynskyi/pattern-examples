### Memento
- behavioral pattern which allows to restore an object to its previous state.

### Parts:
Originator: tracks versions
- saves version - creates Memento
- restores version from Memento

Memento: actual individual version
- value object

Caretaker: stores all versions.
- can get any Memento by date

### Example
Originator: `Post`
Memento: `PostVersion`
Caretaker: `VersionHistory`


### Links
- https://refactoring.guru/design-patterns/memento
- https://makandracards.com/alexander-m/39299-memento
