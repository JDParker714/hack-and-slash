alarm[0] = 200;

player = obj_skeleton;
state = "idle";

count = 0;
index = 0;

dialogue = ds_list_create();
ds_list_add(dialogue, "HAVE YE NEVER \nSEEN A DARN \nFENCE BEFORE?", 
						"JUST PRESS W \nAND GET OVER \nTHERE", 
						"MAKE SURE YOU \nPRESS J TO \nATTACK",
						"DAMN KIDS THESE \nDAYS...");
