/*camera update*/ {
	camera.Exposure = bbmod_lerp_delta_time(camera.Exposure, 1.00, 0.05, delta_time);
	camera.update(delta_time);
	renderer.update(delta_time);
}

/*camera position*/ {
	x = hero_obj.x;
	y = hero_obj.y;
}



















































