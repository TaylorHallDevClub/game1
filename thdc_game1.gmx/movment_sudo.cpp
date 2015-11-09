//In Create
isIdle       = true
isRunning    = false
isJumping    = false
isAttacking  = false

gravity_direction = 270


//In Step
player.x = x
player.y = y

if isIdle 
	sprite_index = spr_player_idle
if isRunning
	sprite_index = spr_player_run
	image_speed  = 0.3
if isJumping
	vspeed -= 10
	gravity = 0.5 //How does this effect?
	if image_index = end_of_image
		isJumping = false
if isAttacking
	sprite_index = spr_player_attack
	image_speed  = 0.3
	if image_index = end_of_image
		isAttacking = false

//In Left Key Press
if(keyboard_check_pressed(vk_left) && !keyboard_check_pressed(vk_right))
	isRunning = true
	x -= 4
	image_xscale -= 1
//In Key Released
if(keyboard_check_released(vk_left))
	isRunning = false
	
//In Right Key Pressed
if(keyboard_check_pressed(vk_right) && !keyboard_check_pressed(vk_left))
	isRunning = true
	x += 4
	image_xscale += 1
//In Right Key Released
if(keyboard_check_released(vk_right))
	isRunning = false