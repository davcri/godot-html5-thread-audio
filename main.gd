extends Node

onready var grid := $CenterContainer/GridContainer

func _ready() -> void:
	add_label("AudioServer/mix rate: ", AudioServer.get_mix_rate())
	add_label("AudioServer/device: ", AudioServer.device)
	add_label("AudioServer/output_latency: ", AudioServer.get_output_latency())
	add_label("ProjectSettings/output_latency: ", str(ProjectSettings.get("audio/output_latency")) + " ms")
	for i in OS.get_audio_driver_count():
		add_label("audio driver #%d" % i, OS.get_audio_driver_name(i))
	$AudioStreamPlayer.play()
	# on chrome: error at tmp_js_export.js:371 Output buffer has not enough frames! Skipping output frame.
	# on firefox: no errors

func add_label(text, val):
	var hbox = HBoxContainer.new()
	var l = Label.new()
	l.text = text
	var v = Label.new()
	v.text = str(val)
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	v.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	grid.add_child(l)
	grid.add_child(v)
