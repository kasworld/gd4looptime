extends VBoxContainer

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
	var per_ar := Permutation.Array(ar)
	timed.end(per_ar.size())
	$LoopResult.text = timed.get_result()

func _on_start_permut_byte_pressed() -> void:
	var timed := BenchHelper.new(10)
	var ar :PackedByteArray = []
	var err := ar.resize(timed.count)
	if err != OK:
		$LoopResult.text = "fail resize %d" % err
		return
	for i :int in timed.count :
		ar[i] = i
	var per_ar := Permutation.ArrayPackedByte(ar)
	timed.end(per_ar.size())
	$LoopResult.text = timed.get_result()
	#print_debug(per_ar)
