extends VBoxContainer


func _on_start_loop_pressed() -> void:
	var lp = int($HBoxContainer/LoopCount.text)
	var st = Time.get_unix_time_from_system()
	for i in lp:
		pass
	var dur = Time.get_unix_time_from_system() - st
	var p = lp / dur
	$LoopResult.text = "loop %d, %f sec, %f loop/sec" % [lp , dur, p ]
