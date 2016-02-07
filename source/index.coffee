getArray = require './getArray'
multiply = require './multiply'


class Matrix
	@fromValues: (values) ->
		numberOfRows = numberOfColums = Math.sqrt values.length
		rows = getArray {dimensions: [numberOfRows, numberOfColums]}

		for rowIndex in [0...numberOfRows]
			for columIndex in [0...numberOfColums]
				rows[rowIndex][columIndex] =
					values[(rowIndex * numberOfColums) + columIndex]

		return new Matrix().setRows rows

	@fromRows: (rows) ->
		return new Matrix().setRows rows

	@fromColums: (colums) ->
		rows = new Array colums[0].length

		colums.forEach (colum) =>
			colum.forEach (value, valueIndex) =>
				rows[valueIndex] ?= []
				rows[valueIndex].push value

		return new Matrix().setRows rows


	@multiply: (matrixA, matrixB) ->
		return multiply matrixA, matrixB

	multiply: (matrix) =>
		if Array.isArray matrix
			@rows = multiply @rows, matrix
		else
			@rows = multiply @rows, matrix.toRows()
		return @

	multiplyVector: (vector = {}) =>
		vectorAsArray = [vector.x, vector.y, vector.z]
		@rows  = multiply @rows, vectorAsArray
		return @

	setRows: (rows) =>
		@rows = rows
		return @

	toRows: () =>
		return @rows



module.exports = Matrix
