### Definition

Construction pattern to avoid long list parameters smell.

Algorithm:
1. Add part
2. Adding part should be chainable, which means method should return `self`
3. Finish with `build` method which should do something with parts you have added before.

