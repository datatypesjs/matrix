runTest = require 'ava'
clone = require 'clone'
Matrix = require '..'


runTest 'Build a matrix from colum-major arrays', (test) ->
	matrix = Matrix.fromColums [
		[1, 2, 3]
		[4, 5, 6]
		[7, 8, 9]
	]

	test.same matrix.toRows(), [
		[1, 4, 7]
		[2, 5, 8]
		[3, 6, 9]
	]


runTest 'Multiply a 3x2 matrix by a 2x3 matrix', (test) ->
	matrix = Matrix.fromRows [
		[1, 2, 3]
		[4, 5, 6]
	]

	test.same(
		matrix
			.multiply [
				[7, 8]
				[9, 10]
				[11, 12]
				]
			.toRows(),
		[
			[58, 64]
			[139, 154]
		]
	)


runTest 'Multiply a 3x1 matrix by a 4x3 matrix', (test) ->
	matrix = Matrix.fromRows [
		[3, 4, 2]
	]

	test.same(
		matrix.multiply([
			[13, 9, 7, 15]
			[8, 7, 4, 6]
			[6, 4, 0, 3]
		]).toRows(),
		[
			[83, 63, 37, 75]
		]
	)


runTest 'Multiply a 1x3 matrix by a 4x4 matrix', (test) ->
	matrix = Matrix.fromRows [
		[1, 0, 0, 7]
		[0, 1, 0, 6]
		[0, 0, 1, 8]
		[0, 0, 0, 1]
	]

	test.same(
		matrix.multiply([
			[3]
			[4]
			[2]
			[1]
		]).toRows(),
		[
			[10]
			[10]
			[10]
			[1]
		]
	)


runTest 'Create a matrix from a continuous array', (test) ->
	matrix = Matrix.fromValues(
		[1, 0, 0, 0,
		0, 1, 0, 0,
		0, 0, 1, 0,
		0, 0, 0, 1]
	)

	test.same(
		matrix.toRows(),
		[
			[1, 0, 0, 0]
			[0, 1, 0, 0]
			[0, 0, 1, 0]
			[0, 0, 0, 1]
		]
	)
