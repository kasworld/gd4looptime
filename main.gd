extends VBoxContainer

func _on_start_loop_pressed() -> void:
	var count := int($HBoxContainer/LoopCount.text)
	$LoopResult.text += "loop %d\n" % count
	var timed := BenchHelper.new()
	for i :int in count :
		pass
	timed.end(count)
	$LoopResult.text += timed.to_string()  + "\n" + "\n"


func _on_start_alloc_pressed() -> void:
	var count := int($HBoxContainer/LoopCount.text)
	$LoopResult.text += "alloc %d\n" % count
	var timed := BenchHelper.new()
	var ar :PackedByteArray = []
	var err := ar.resize(count)
	if err != OK:
		$LoopResult.text += "fail resize %d\n" % err
		return
	timed.end(count)
	$LoopResult.text += timed.to_string()  + "\n"

func _on_permut_slow_recurs_pressed() -> void:
	var timed := BenchHelper.new()
	var count := int($HBoxContainer/LoopCount.text)
	$LoopResult.text += "permut_slow_recurs %d\n" % count
	if count >= 14:
		$LoopResult.text += "too large %d (try 10 ~ 12)\n" % count
		return

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
	var timed := BenchHelper.new()
	var count := int($HBoxContainer/LoopCount.text)
	$LoopResult.text += "permut_slow_recurs_p_byte %d\n" % count
	if count >= 14:
		$LoopResult.text += "too large %d (try 10 ~ 12)\n" % count
		return
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
	var timed := BenchHelper.new()
	var count := int($HBoxContainer/LoopCount.text)
	$LoopResult.text += "permutate_heap_recurs %d\n" % count
	if count >= 14:
		$LoopResult.text += "too large %d (try 10 ~ 12)\n" % count
		return
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
	var timed := BenchHelper.new()
	var count := int($HBoxContainer/LoopCount.text)
	$LoopResult.text += "permutate_heap_loop %d\n" % count
	if count >= 14:
		$LoopResult.text += "too large %d (try 10 ~ 12)\n" % count
		return
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
	var timed := BenchHelper.new()
	var count := int($HBoxContainer/LoopCount.text)
	$LoopResult.text += "permutate_heap_loop_p_byte %d\n" % count
	if count >= 14:
		$LoopResult.text += "too large %d (try 10 ~ 12)\n" % count
		return
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
