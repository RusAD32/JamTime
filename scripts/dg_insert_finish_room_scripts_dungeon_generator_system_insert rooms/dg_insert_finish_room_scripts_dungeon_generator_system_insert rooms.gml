var my_walk, _finish_room;
_finish_room[0] = c_t.finishU;
_finish_room[1] = c_t.finishR;
_finish_room[2] = c_t.finish;        
_finish_room[3] = c_t.finishL;

my_walk[0] = walk[3];
my_walk[1] = walk[2];
my_walk[2] = walk[1];
my_walk[3] = walk[0];

insert_room_into_dungeon(_finish_room, my_walk);
