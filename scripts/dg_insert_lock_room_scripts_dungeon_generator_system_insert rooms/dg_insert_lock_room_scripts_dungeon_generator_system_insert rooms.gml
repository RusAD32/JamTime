/*                                                                                                */
/* It is now time to place the start cell and the finish cell into the dungeon.                   */
/* First, we randomly select, which goes first, and which goes second.                            */
/*                                                                                                */

var my_walk;
var key_room, lock_room;
      
lock_room[0] = c_t.lockU;
lock_room[1] = c_t.lockR;
lock_room[2] = c_t.lock;        
lock_room[3] = c_t.lockL;
       
my_walk[0] = walk[2];
my_walk[1] = walk[1];
my_walk[2] = walk[0];
my_walk[3] = walk[3];

insert_room_into_dungeon(lock_room, my_walk);
