cow_count = 30;

for(i = 0; i < cow_count; i++) {
	instance_create_layer(irandom_range(350,1070),286,"Instances",obj_cow);
}
