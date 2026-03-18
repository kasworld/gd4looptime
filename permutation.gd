class_name Permutation

static func Factorial(n: int) -> int:
	if n <= 1:
		return 1
	var result := 1
	for i in range(2, n + 1):
		result *= i
	return result

# Main function to get all permutations as an array of arrays
static func Array(array :Array) -> Array:
	var output :Array = []
	_array_helper(array, 0, output)
	return output

# Recursive helper function
static func _array_helper(array :Array, start_index :int, output :Array) -> void:
	if start_index == array.size():
		# Base case: a complete permutation is found, add it to the output
		# Use .duplicate(true) to ensure a deep copy if elements are complex objects/arrays
		output.append(array.duplicate())
		return

	for i :int in range(start_index, array.size()):
		# Swap current element with the element at the start index
		#array.swap(start_index, i)
		var tmp = array[start_index]
		array[start_index] = array[i]
		array[i] = tmp

		# Recurse for the next index
		_array_helper(array, start_index + 1, output)

		# Backtrack: swap them back to restore the original array state for the next iteration
		#array.swap(start_index, i)
		#tmp = array[i]
		array[i] = array[start_index]
		array[start_index] = tmp

static func ArrayPackedByte(array :PackedByteArray) -> Array:
	var output :Array = []
	_array_pbyte_helper(array, 0, output)
	return output

static func _array_pbyte_helper(array :PackedByteArray, start_index :int, output :Array) -> void:
	if start_index == array.size():
		output.append(array.duplicate())
		return
	for i :int in range(start_index, array.size()):
		var tmp := array[start_index]
		array[start_index] = array[i]
		array[i] = tmp
		_array_pbyte_helper(array, start_index + 1, output)
		array[i] = array[start_index]
		array[start_index] = tmp
