#define platform_collisions_create_new
{
    //==================================================================
    //                       COLLISION VARIABLES
    //==================================================================
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    bld_y = bbox_bottom;
    brd_y = bbox_bottom;
    
    trr_x = bbox_right;
    brr_x = bbox_right;
    
    tll_x = bbox_left;
    bll_x = bbox_left;
    
    tlu_y = bbox_top;
    tru_y = bbox_top;
    // This must be greater than the top speed of the object.
    check_distance = argument0;
}


#define platform_collisions_step_new
{
    //==================================================================
    //                             FLOOR
    //==================================================================
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        //Find the floor on the left
    bld_y = bbox_bottom;
    while(!collision_point(bbox_left,bld_y,argument0,true,true) && bld_y < bbox_bottom+check_distance){
        bld_y +=1;
    }
    bld_y -= 1; //1 pixel correction because of bbox
        //Find the floor on the right
    brd_y = bbox_bottom;
    while(!collision_point(bbox_right,brd_y,argument0,true,true) && brd_y < bbox_bottom+check_distance){
        brd_y +=1;
    }
    brd_y -= 1;//1 pixel correction because of bbox
    //------------------------------------------------------------------
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //==================================================================
    //                          CEILING
    //==================================================================
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        //Find the floor on the left
    tlu_y = bbox_top;
    while(!collision_point(bbox_left,tlu_y,argument0,true,true) && tlu_y > bbox_top-check_distance){
        tlu_y -=1;
    }
    tlu_y += 1; //1 pixel correction because of bbox
        //Find the floor on the right
    tru_y = bbox_top;
    while(!collision_point(bbox_right,tru_y,argument0,true,true) && tru_y > bbox_top-check_distance){
        tru_y -=1;
    }
    tru_y += 1;//1 pixel correction because of bbox
    //------------------------------------------------------------------
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //==================================================================
    //                           RIGHT WALL
    //==================================================================
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        //Find the wall on the top right
    trr_x = bbox_right;
    while(!collision_point(trr_x,bbox_top,argument0,true,true) && trr_x < bbox_right+check_distance){
        trr_x +=1;
    }
    trr_x -= 1;//1 pixel correction because of bbox
        //Find the wall on the bottom right
    brr_x = bbox_right;
    while(!collision_point(brr_x,bbox_bottom,argument0,true,true) && brr_x < bbox_right+check_distance){
        brr_x +=1;
    }
    brr_x -= 1; //1 pixel correction because of bbox
    //------------------------------------------------------------------
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //==================================================================
    //                           LEFT WALL
    //==================================================================
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        //Find the wall on the top right
    tll_x = bbox_left;
    while(!collision_point(tll_x,bbox_top,argument0,true,true) && tll_x > bbox_left-check_distance){
        tll_x -=1;
    }
    tll_x += 1;//1 pixel correction because of bbox
        //Find the wall on the bottom right
    bll_x = bbox_left;
    while(!collision_point(bll_x,bbox_bottom,argument0,true,true) && bll_x > bbox_left-check_distance){
        bll_x -=1;
    }
    bll_x += 1; //1 pixel correction because of bbox
    //------------------------------------------------------------------
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //==================================================================
    //                             GRAVITY
    //==================================================================
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        //Find the closest floor and move towards it if you aren't touching it.
    if(bbox_bottom <= min(bld_y,brd_y)){
        if(point_distance(x,bbox_bottom,x,min(bld_y,brd_y)) < vspeed){
            y=min(bld_y,brd_y)-(bbox_bottom-y);
            vspeed = 0;
        }
    }else{
        y=min(bld_y,brd_y)-(bbox_bottom-y);
        vspeed = 0;
    }
    //------------------------------------------------------------------
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //==================================================================
    //                        CEILING COLLISION
    //==================================================================
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        //Find the closest floor and move towards it if you aren't touching it.
    if(bbox_top >= max(tlu_y,tru_y)){
        if((point_distance(x,bbox_top,x,max(tlu_y,tru_y))*-1) > vspeed){
            y=max(tlu_y,tru_y)+(y-bbox_top);
            vspeed = 0;
        }
    }else{
        y=max(tlu_y,tru_y)+(y-bbox_top);
        vspeed = 0;
    }
    //------------------------------------------------------------------
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //==================================================================
    //                        COLLIDING RIGHT
    //==================================================================
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    if(bbox_right <= min(trr_x,brr_x)){
        if(point_distance(bbox_right,y,min(brr_x,trr_x),y) < hspeed){
            x=min(brr_x,trr_x)-(bbox_right-x);
            hspeed = 0;
        }
    }else{
        x=min(brr_x,trr_x)-(bbox_right-x);
        hspeed = 0;
    }
    //------------------------------------------------------------------
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //==================================================================
    //                        COLLIDING LEFT
    //==================================================================
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    if(bbox_left >= max(tll_x,bll_x)){
        if((point_distance(bbox_left,y,max(bll_x,tll_x),y)*-1) > hspeed){
            x=max(bll_x,tll_x)+(x-bbox_left);
            hspeed = 0;
        }
    }else{
        x=max(bll_x,tll_x)+(x-bbox_left);
        hspeed = 0;
    }
    //------------------------------------------------------------------
}


#define platform_friction_new
{
    friction_amount = argument1;
    friction_on = argument0
    if(friction_on){
        if(hspeed != 0){
            if(hspeed > 0){
                hspeed -= friction_amount;
            }
            
            if(hspeed < 0){
                hspeed += friction_amount;
            }
        }
        if(hspeed < friction_amount && hspeed > -friction_amount){
            hspeed = 0;
        }
    }
}


#define platform_corner_check_new
{
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //==================================================================
    //                HANDLE COLLISIONS WITH CORNERS
    //==================================================================
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    if(hspeed != 0){
        if(!place_free(x+hspeed,y+vspeed)){
            hspeed = 0;
        }
    }
}

