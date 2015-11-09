//Check Player State
if(isIdle)
{
    sprite_index = spr_ply_idle;
    image_speed  = 0;
}
if(isRunning)
{
    sprite_index = spr_ply_run;
    image_speed  = 0.3;
}
if(isJumping)
{
    vspeed -= 10;
    gravity = 0.5;
    /*if image_index = end_of_image
        isJumping = false;*/
}
if(isAttacking)
{
    sprite_index = spr_ply_attack;
    image_speed  = 0.3;
    /*if image_index = end_of_image
        isJumping = false;*/
}
