getArray = ({dimensions, initialValue} = {}) ->
	unless dimensions.length
		return initialValue

	array = []
	subDimensions = dimensions.slice(1)
	index = 0

	while index < dimensions[0]
		array.push getArray {
			dimensions: subDimensions
			initialValue: initialValue
		}
		index++

	return array

module.exports = getArray
