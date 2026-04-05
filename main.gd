extends VBoxContainer

func get_count(name:String, from:int, to :int) -> int:
	var count := int($HBoxContainer/LoopCount.text)
	$LoopResult.text = "%s %d (%d ~ %d) \n" % [name, count, from, to]
	if count < from or count > to:
		$LoopResult.text += "out of range %d (%d ~ %d)\n" % [count, from, to]
		return -1
	return count


func _on_start_loop_pressed() -> void:
	var count := get_count("loop", 1, 1000000000000)
	if count < 0:
		return
	var timed := BenchHelper.new()
	for i :int in count :
		pass
	timed.end(count)
	$LoopResult.text += timed.to_string()  + "\n" + "\n"


func _on_start_alloc_pressed() -> void:
	var count := get_count("alloc", 1, 1000000000000)
	if count < 0:
		return
	var timed := BenchHelper.new()
	var ar :PackedByteArray = []
	var err := ar.resize(count)
	if err != OK:
		$LoopResult.text += "fail resize %d\n" % err
		return
	timed.end(count)
	$LoopResult.text += timed.to_string()  + "\n"

func _on_permut_slow_recurs_pressed() -> void:
	var count := get_count("permut_slow_recurs", 9, 14)
	if count < 0:
		return
	var timed := BenchHelper.new()
	var ar := []
	var err := ar.resize(count)
	if err != OK:
		$LoopResult.text += "fail resize %d\n" % err
		return
	for i :int in count :
		ar[i] = i
	var per_ar := Permutation.SlowRecursive(ar)
	timed.end(per_ar.size())
	$LoopResult.text += timed.to_string()  + "\n"
	#print_debug(per_ar)

func _on_permut_slow_recurs_p_byte_pressed() -> void:
	var count := get_count("permut_slow_recurs_p_byte", 9, 14)
	if count < 0:
		return
	var timed := BenchHelper.new()
	var ar :PackedByteArray = []
	var err := ar.resize(count)
	if err != OK:
		$LoopResult.text += "fail resize %d\n" % err
		return
	for i :int in count :
		ar[i] = i
	var per_ar := Permutation.SlowRecursivePackedByte(ar)
	timed.end(per_ar.size())
	$LoopResult.text += timed.to_string()  + "\n"
	#print_debug(per_ar)


func _on_permutate_heap_recurs_pressed() -> void:
	var count := get_count("permutate_heap_recurs", 9, 14)
	if count < 0:
		return
	var timed := BenchHelper.new()
	var ar := []
	var err := ar.resize(count)
	if err != OK:
		$LoopResult.text += "fail resize %d\n" % err
		return
	for i :int in count :
		ar[i] = i
	var per_ar := Permutation.HeapRecursive(ar)
	timed.end(per_ar.size())
	$LoopResult.text += timed.to_string()  + "\n"
	#print_debug(per_ar)


func _on_permutate_heap_loop_pressed() -> void:
	var count := get_count("permutate_heap_loop", 9, 14)
	if count < 0:
		return
	var timed := BenchHelper.new()
	var ar := []
	var err := ar.resize(count)
	if err != OK:
		$LoopResult.text += "fail resize %d\n" % err
		return
	for i :int in count :
		ar[i] = i
	var per_ar := Permutation.HeapLoop(ar)
	timed.end(per_ar.size())
	$LoopResult.text += timed.to_string()  + "\n"
	#print_debug(per_ar)


func _on_permutate_heap_loop_p_byte_pressed() -> void:
	var count := get_count("permutate_heap_loop_p_byte", 9, 14)
	if count < 0:
		return
	var timed := BenchHelper.new()
	var ar :PackedByteArray= []
	var err := ar.resize(count)
	if err != OK:
		$LoopResult.text += "fail resize %d\n" % err
		return
	for i :int in count :
		ar[i] = i
	var per_ar := Permutation.HeapLoopPByte(ar)
	timed.end(per_ar.size())
	$LoopResult.text += timed.to_string()  + "\n"
	#print_debug(per_ar)
