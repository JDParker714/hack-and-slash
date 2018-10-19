if state == "idling" {
	state = "idle";
} else if state == "death" {
	instance_destroy();
}