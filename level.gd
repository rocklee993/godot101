extends Node2D

var laser_scene = preload("res://laser.tscn")
var grenade_scene = preload("res://grenade.tscn")

func _on_gate_player_entered_gate():
	print("player has entered the gate")


func _on_player_lasered(pos,direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos 
	
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90 
	laser.direction = direction
	$projectiles.add_child(laser)
	
	


func _on_player_grenaded(pos,direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	$projectiles.add_child(grenade)
	grenade.linear_velocity = direction * grenade.speed
	
