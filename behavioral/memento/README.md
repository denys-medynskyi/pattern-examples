### Memento
- behavioral pattern which allows to restore an object to its previous state.

Consists of 3 classes:
- Originator: tracks versions. Knows how to take a snapshot and get snapshot.
- - saves version - creates Memento
- - restores version from Memento

- Memento: actual individual versions(snapshots)
- - value object

- Caretaker: stores all versions.
- - can get any Memento by date

### Example
Originator: `Post`
Memento: `PostVersion`
Caretaker: `VersionHistory`


### Links
- https://refactoring.guru/design-patterns/memento
- https://makandracards.com/alexander-m/39299-memento
