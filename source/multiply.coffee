getArray = require './getArray'

module.exports = (rows, multiplyRows) ->
	numberOfColums = multiplyRows[0].length

	resultRows = getArray {
		dimensions: [rows.length, numberOfColums]
		initialValue: 0
	}

	rows.forEach (row, rowIndex) ->
		row.forEach (value, valueIndex) ->
			for multiplyValueIndex in [0...numberOfColums]
				resultRows[rowIndex][multiplyValueIndex] +=
					value * multiplyRows[valueIndex][multiplyValueIndex]

	return resultRows
