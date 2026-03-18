extends VBoxContainer



# Main function to get all permutations as an array of arrays
static func generate_all_permutations(array :Array) -> Array:
	var output :Array = []
	_recursive_permutation_helper(array, 0, output)
	return output

# Recursive helper function
static func _recursive_permutation_helper(array :Array, start_index :int, output :Array) -> void:
	if start_index == array.size():
		# Base case: a complete permutation is found, add it to the output
		# Use .duplicate(true) to ensure a deep copy if elements are complex objects/arrays
		output.append(array.duplicate())
		return

	for i in range(start_index, array.size()):
		# Swap current element with the element at the start index
		#array.swap(start_index, i)
		var tmp = array[start_index]
		array[start_index] = array[i]
		array[i] = tmp

		# Recurse for the next index
		_recursive_permutation_helper(array, start_index + 1, output)

		# Backtrack: swap them back to restore the original array state for the next iteration
		#array.swap(start_index, i)
		#tmp = array[i]
		array[i] = array[start_index]
		array[start_index] = tmp


func _on_start_loop_pressed() -> void:
	var timed := BenchHelper.new($HBoxContainer/LoopCount.text)
	for i :int in timed.count :
		pass
	timed.end()
	$LoopResult.text = timed.get_result()


func _on_start_alloc_pressed() -> void:
	var timed := BenchHelper.new($HBoxContainer/LoopCount.text)
	var ar :PackedByteArray = []
	var err := ar.resize(timed.count)
	if err != OK:
		$LoopResult.text = "fail resize %d" % err
		return
	timed.end()
	$LoopResult.text = timed.get_result()

func _on_start_permutation_pressed() -> void:
	var timed := BenchHelper.new(10)
	var ar := []
	var err := ar.resize(timed.count)
	if err != OK:
		$LoopResult.text = "fail resize %d" % err
		return
	for i :int in timed.count :
		ar[i] = i
	var per_ar := generate_all_permutations(ar)
	timed.end(per_ar.size())
	$LoopResult.text = timed.get_result()

func _on_start_permut_byte_pressed() -> void:
	var timed := BenchHelper.new(10)
	var ar :Array[int] = []
	var err := ar.resize(timed.count)
	if err != OK:
		$LoopResult.text = "fail resize %d" % err
		return
	for i :int in timed.count :
		ar[i] = i
	var per_ar := generate_all_permutations(ar)
	timed.end(per_ar.size())
	$LoopResult.text = timed.get_result()
