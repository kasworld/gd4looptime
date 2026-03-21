extends VBoxContainer

func _on_start_loop_pressed() -> void:
	var count := int($HBoxContainer/LoopCount.text)
	var timed := BenchHelper.new()
	for i :int in count :
		pass
	timed.end(count)
	$LoopResult.text = timed.to_string()


func _on_start_alloc_pressed() -> void:
	var count := int($HBoxContainer/LoopCount.text)
	var timed := BenchHelper.new()
	var ar :PackedByteArray = []
	var err := ar.resize(count)
	if err != OK:
		$LoopResult.text = "fail resize %d" % err
		return
	timed.end(count)
	$LoopResult.text = timed.to_string()

func _on_start_permutation_pressed() -> void:
	var timed := BenchHelper.new()
	var permut_size := 10
	var ar := []
	var err := ar.resize(permut_size)
	if err != OK:
		$LoopResult.text = "fail resize %d" % err
		return
	for i :int in permut_size :
		ar[i] = i
	var per_ar := Permutation.Array(ar)
	timed.end(per_ar.size())
	$LoopResult.text = timed.to_string()
	#print_debug(per_ar)

func _on_start_permut_byte_pressed() -> void:
	var timed := BenchHelper.new()
	var permut_size := 10
	var ar :PackedByteArray = []
	var err := ar.resize(permut_size)
	if err != OK:
		$LoopResult.text = "fail resize %d" % err
		return
	for i :int in permut_size :
		ar[i] = i
	var per_ar := Permutation.ArrayPackedByte(ar)
	timed.end(per_ar.size())
	$LoopResult.text = timed.to_string()
	#print_debug(per_ar)


func _on_permutate_heap_pressed() -> void:
	var timed := BenchHelper.new()
	var permut_size := 10
	var ar := []
	var err := ar.resize(permut_size)
	if err != OK:
		$LoopResult.text = "fail resize %d" % err
		return
	for i :int in permut_size :
		ar[i] = i
	var per_ar := Permutation.HeapRecursive(ar)
	timed.end(per_ar.size())
	$LoopResult.text = timed.to_string()
	#print_debug(per_ar)


func _on_permutate_heap_loop_pressed() -> void:
	var timed := BenchHelper.new()
	var permut_size := 10
	var ar := []
	var err := ar.resize(permut_size)
	if err != OK:
		$LoopResult.text = "fail resize %d" % err
		return
	for i :int in permut_size :
		ar[i] = i
	var per_ar := Permutation.HeapLoop(ar)
	timed.end(per_ar.size())
	$LoopResult.text = timed.to_string()
	#print_debug(per_ar)
