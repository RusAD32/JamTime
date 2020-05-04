/**************************************************************************************************/
/*                                                                                                */
/* This is the walking script. It is only intended for demonstration purposes.                    */
/*                                                                                                */

/* Start the animation if the player is moving, stop it otherwise.                                */
if(speed > 0) 
{
    image_speed = 0.2;
}
else {
    image_speed = 0;
}

/*                                                                                                */
/* If spacebar or shift or A button on a gamepad are pressed, increase walking speed.             */
/*                                                                                                */
if keyboard_check(vk_space) or gamepad_button_check(0, gp_face1) or keyboard_check(vk_shift)
{
    walk_speed = 5;
}
else 
{
    walk_speed = 3;
}

/*                                                                                                */
/* Reset horizontal and vertical speed of the player.                                             */
/*                                                                                                */
vspeed = 0
hspeed = 0

/*                                                                                                */
/* If the d-pad buttons or WASD or some of the arrow keys are pressed, set vertical speed and     */
/* horizontal speed accordingly.                                                                  */
/*                                                                                                */
if keyboard_check(ord("W")) or gamepad_button_check(0, gp_padu) or keyboard_check(vk_up) 
{
    vspeed = -walk_speed;
}

if keyboard_check(ord("S")) or gamepad_button_check(0, gp_padd) or keyboard_check(vk_down) 
{
    vspeed = walk_speed;
}

if keyboard_check(ord("A")) or gamepad_button_check(0, gp_padl) or keyboard_check(vk_left) 
{
    hspeed = -walk_speed;
}

if keyboard_check(ord("D")) or gamepad_button_check(0, gp_padr) or keyboard_check(vk_right) 
{
    hspeed = walk_speed; 
}

/*                                                                                                */
/* If the left stick on a controller is tilted, set horizontal and vertical speed accordingly.    */
/*                                                                                                */
if abs(gamepad_axis_value(0, gp_axislh)) > 0.5
{
    hspeed = walk_speed * gamepad_axis_value(0, gp_axislh);
}

if abs(gamepad_axis_value(0, gp_axislv)) > 0.5
{
    vspeed = walk_speed * gamepad_axis_value(0, gp_axislv)
}


/*                                                                                                */
/* If we are moving to the left and there's a wall, stop horizontal movement.                     */
/*                                                                                                */
if hspeed < 0
{
    if place_meeting(x - walk_speed, y, obj_any_wall)
    {
        hspeed = 0;
    }
}

/*                                                                                                */
/* If we are moving to the right and there's a wall, stop horizontal movement.                    */
/*                                                                                                */
if hspeed > 0
{
    if place_meeting(x + walk_speed, y, obj_any_wall)
    {
        hspeed = 0;
    }
}

/*                                                                                                */
/* If we are moving up and there's a wall, stop vertical movement.                                */
/*                                                                                                */
if vspeed < 0
{
    if place_meeting(x, y - walk_speed, obj_any_wall)
    {
        vspeed = 0;
    }
}

/*                                                                                                */
/* If we are moving down and there's a wall, stop vertical movement.                              */
/*                                                                                                */
if vspeed > 0
{
    if place_meeting(x, y + walk_speed, obj_any_wall)
    {
        vspeed = 0;
    }
}


/*                                                                                                */
/* Set player sprite according to the direction of movement.                                      */
/*                                                                                                */
if vspeed == 0 and hspeed > 0
{
    // facing 0
    sprite_index = spr_player_walk_right;
}       
if vspeed < 0 and hspeed == 0
{
    // facing 90
    sprite_index = spr_player_walk_up;
}
if vspeed == 0 and hspeed < 0
{
    // facing 180
    sprite_index = spr_player_walk_left;
}
if vspeed > 0 and hspeed == 0
{
    // facing 270
    sprite_index = spr_player_walk_down;
}       

