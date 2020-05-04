/// @description Insert description here
// You can write your code in this editor


instance_activate_all();
instance_deactivate_region(x-deactivaion_offset, y-deactivaion_offset, 2*deactivaion_offset, 2*deactivaion_offset,false,true);
instance_activate_object(oCamera);
instance_activate_object(oTransition);
instance_activate_object(oLevelGenerator);