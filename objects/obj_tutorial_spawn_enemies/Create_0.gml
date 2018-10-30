cow_count = 10;

for(i = 0; i < cow_count; i++) {
	instance_create_layer(irandom_range(350,1200),286,"Instances",obj_cow);
	instance_create_layer(irandom_range(350,1200),286,"Instances",obj_spooked_cow);
}
