# Matrix

Class for 4 by 4 row-major matrices for transformations in 3D.


## Installation

```sh
npm install --save @datatypes/matrix
```


## Usage

```js
import Matrix from '@datatypes/matrix'

const matrixA = Matrix.fromRows([
	[1, 2, 3],
	[4, 5, 6],
	[7, 8, 9]
])
const matrixB = Matrix.fromRows([
	[ 7,  8],
	[ 9, 10],
	[11, 12]
])

console.log(
	matrixA
		.multiply(matrixB)
		.toRows()
)
```

Output:

```sh
[
	[ 58,  64],
	[139, 154],
	[220, 244]
]
```

For a more detailed listing of available features
check out [the tests](./test/main.coffee).
