# Starter File Templates

Use these when setting up a new problem. Replace `{FunctionName}`, `{functionName}`, `{params}` with the actual function signature from the problem.

---

## JavaScript

**main.js**
```js
/**
 * @param {type} param
 * @return {type}
 */
function {functionName}({params}) {
  // your solution here
}

module.exports = { {functionName} };
```

**main.spec.js**
```js
const { {functionName} } = require('./main');

describe('{functionName}', () => {
  test('example 1', () => {
    // fill in from problem examples
    expect({functionName}(...)).toEqual(...);
  });

  test('example 2', () => {
    expect({functionName}(...)).toEqual(...);
  });
});
```

**package.json** (if not present)
```json
{
  "scripts": { "test": "jest" },
  "devDependencies": { "jest": "^29.0.0" }
}
```
Run `npm install` after creating.

---

## TypeScript

**main.ts**
```ts
function {functionName}({params}: {types}): {returnType} {
  // your solution here
}

export { {functionName} };
```

**main.spec.ts**
```ts
import { {functionName} } from './main';

describe('{functionName}', () => {
  test('example 1', () => {
    expect({functionName}(...)).toEqual(...);
  });
});
```

**package.json** (if not present)
```json
{
  "scripts": { "test": "jest" },
  "devDependencies": {
    "jest": "^29.0.0",
    "ts-jest": "^29.0.0",
    "@types/jest": "^29.0.0",
    "typescript": "^5.0.0"
  },
  "jest": {
    "preset": "ts-jest",
    "testEnvironment": "node"
  }
}
```

---

## Python

**main.py**
```python
from typing import List, Optional


def {function_name}({params}) -> {return_type}:
    # your solution here
    pass
```

**test_main.py**
```python
from main import {function_name}


def test_example_1():
    # fill in from problem examples
    assert {function_name}(...) == ...


def test_example_2():
    assert {function_name}(...) == ...
```

Run: `pytest` (install with `pip install pytest` if needed)

---

## Go

**main.go**
```go
package main

func {FunctionName}({params} {types}) {returnType} {
    // your solution here
    return
}
```

**main_test.go**
```go
package main

import (
    "testing"
)

func Test{FunctionName}(t *testing.T) {
    tests := []struct {
        // fill in fields
        want // return type
    }{
        // fill in from problem examples
        {},
    }

    for _, tt := range tests {
        got := {FunctionName}(/* tt fields */)
        if got != tt.want {
            t.Errorf("{FunctionName}() = %v, want %v", got, tt.want)
        }
    }
}
```

Run: `go test ./...`
