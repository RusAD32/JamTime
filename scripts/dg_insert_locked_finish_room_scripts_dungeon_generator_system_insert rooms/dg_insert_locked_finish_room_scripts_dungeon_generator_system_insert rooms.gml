var my_walk, _finish_room;

_finish_room[0] = c_t.locked_finishU;
_finish_room[1] = c_t.locked_finishR;
_finish_room[2] = c_t.locked_finish;        
_finish_room[3] = c_t.locked_finishL;

my_walk[0] = walk[1];
my_walk[1] = walk[2];
my_walk[2] = walk[0];
my_walk[3] = walk[3];

insert_room_into_dungeon(_finish_room, my_walk);
