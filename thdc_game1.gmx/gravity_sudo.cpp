//In Create
gav   = 0.2
vspd   = 0
jspd  = 7

//In Step
key_up = keyboard_check_pressed(vk_up)
if place_meeting(x, y + 1, obj_collider)
	vspd = key_up * -jspd

if vspd < 10 
	vspd += grav

y += vspd