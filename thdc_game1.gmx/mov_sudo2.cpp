//In Create
	//Enums
	pstate_run_left  = 0
	pstate_run_right = 1
	player_state     = -1

	//Bools
	isJumping   = false
	isAttacking = false

//In Key Pressed<left>
sprite_index = spr_ply_run
image_speed  = 0.3
x -= 4
image_xscale = -1
player_state = pstate_run_left
	//In Key Released<left>
	if(pstate_run_left)
		sprite_index = spr_ply_idle
		image_speed = 0

//In Key Pressed<right>
sprite_index = spr_ply_run
image_speed  = 0.3
x += 4
image_xscale = 1
player_state = pstate_run_right
	//In Key Released<right>
	if(pstate_run_right)
		sprite_index = spr_ply_idle
		image_speed = 0

//In Step
switch(keyboard_key)
	case vk_left:
		player_state = pstate_run_left
		break
	case vk_right:
		player_state = pstate_run_right
		break 