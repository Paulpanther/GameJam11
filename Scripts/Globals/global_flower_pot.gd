extends Node

var minutes = 260
var minutes_win = 12 * 60 + 15

func get_rotation_hour_deg():
	return (fmod(minutes, 720.0) / 720.0) * 360.0
	
	
func get_rotation_minute_deg():
	return (fmod(minutes, 60.0) / 60.0) * 360.0

func is_minutes_correct():
	return abs(minutes - minutes_win) < 3

var window_state = "closed"

var flower_state = 0

var drawer_open = false
var closet_open = false
