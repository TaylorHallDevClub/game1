//player states
idle = true;
running = false;
attacking = false;

if(idle)
    sprite_index = spr_ply_idle;
if(running)
    sprite_index = spr_ply_run;
if(attacking)
    sprite_index = spr_ply_attack;
        

//outline controls
key_w = keyboard_check(ord('W'));
key_a = keyboard_check(ord('A'));
key_s = keyboard_check(ord('S'));
key_d = keyboard_check(ord('D'));

//on key press
if(key_w){vspeed -= 5; running = true;}
if(key_a){hspeed -= 5; running = true;}
if(key_s){vspeed += 5; running = true;}
if(key_d){hspeed += 5; running = true;}

//on key release
if(key_a and key_d){hspeed = 0; idle = true;}
if(key_w and key_s){vspeed = 0; idle = true;}
if(!key_a and !key_d){hspeed = 0; idle = true;}
if(!key_w and !key_s){vspeed = 0; idle = true;}

//limit speed

if(hspeed > 5){hspeed = 5};
if(hspeed < -5){hspeed = -5};
if(vspeed > 5){vspeed = 5};
if(vspeed < -5){vspeed = -5};
