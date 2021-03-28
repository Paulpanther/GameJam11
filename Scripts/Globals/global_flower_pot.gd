extends Node

var minutes = 260

func get_rotation_hour_deg():
	return (fmod(minutes, 720.0) / 720.0) * 360.0
	
	
func get_rotation_minute_deg():
	return (fmod(minutes, 60.0) / 60.0) * 360.0

var window_state = "closed"

var flower_state = 1
