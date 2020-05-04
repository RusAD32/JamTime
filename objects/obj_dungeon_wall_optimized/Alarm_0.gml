var blocks = 0;

for(i=1; i<4; i++)
{
    // Try to change into a 2x block
    if place_meeting(x + i*32, y, obj_dungeon_wall)
    {
        blocks += 1;
    }
}


if blocks == 3
{
    for(i=1; i<4; i++)
    {
        var obj = collision_point( x + i*32, y, obj_dungeon_wall, false, true );
        
        with (obj) {
            instance_destroy();
        }    
    }
    instance_change(obj_dungeon_wall_4x, false);
}
else if blocks > 0
{
    // Try to change into a 2x block
    if place_meeting(x + 32, y, obj_dungeon_wall)
    {
        var obj = collision_point( x + 32, y, obj_dungeon_wall, false, true );
        
        with (obj) {
            instance_destroy();
        }
        
        instance_change(obj_dungeon_wall_2x, true);
    }
}

