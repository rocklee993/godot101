extends CharacterBody2D
var base_velocity = 300
var can_laser = true
var can_grenade = true
signal lasered(pos,direction)	
signal grenaded(pos,direction)

func _process(_delta):
	movement(_delta)
	shooting()
	
	look_at(get_global_mouse_position())
	
func movement(_delta)	:
	var direction = Input.get_vector("left","right","up","down")
	if(Input.is_action_pressed("sprint")):
		base_velocity = 500
	else:
		base_velocity = 300
	velocity = direction * base_velocity
	move_and_slide()
func shooting() :
		var player_direction = (get_global_mouse_position() - position).normalized()
		if(Input.is_action_pressed("laser") and can_laser):
			
			var laser_pos = $laser_start_pos.get_children()
			
			can_laser = false
			var selected_pos = laser_pos[0]
			$laser_timer.start()
			lasered.emit(selected_pos.global_position,player_direction)
			
		if(Input.is_action_pressed("grenade") and can_grenade):
			var grenade_pos = $laser_start_pos.get_children()
			can_grenade = false	
			var selected_pos = grenade_pos[0]
			$grenade_timer.start()
		 	
			grenaded.emit(selected_pos.global_position,player_direction)


func _on_laser_timer_timeout():
	can_laser = true


func _on_grenade_timer_timeout():
	can_grenade = true
