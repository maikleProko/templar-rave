
/*rendering*/ {
	os_powersave_enable(false);
	renderer = new BBMOD_Renderer();
	renderer.UseAppSurface = true;
	if(max(window_get_width(), window_get_height())>1366)
		renderer.RenderScale = 1366/max(window_get_width(), window_get_height());
	renderer.EnableShadows = true;
	renderer.EnablePostProcessing = true;
	renderer.ChromaticAberration = 1.0;
	renderer.ColorGradingLUT = sprite_get_texture(color_grading_spr, 0);
	renderer.Antialiasing = BBMOD_EAntialiasing.FXAA;
	renderer.ShadowmapArea = 300;
	renderer.ShadowmapResolution = 2048;
}

/*camera*/ {
	camera = new BBMOD_Camera();
	z=1;
	camera.FollowObject = self;
	camera.FollowFactor = 1;
	x = hero_obj.x+6
	y = hero_obj.y;
	camera.Offset = new BBMOD_Vec3(-hero_obj.x, hero_obj.y-60, 75);
	camera.Position = new BBMOD_Vec3(6, 0, 6);
	camera.Zoom = 1;
	camera.Direction = 90;
	camera.DirectionUp = -50;
	camera.set_mouselook(false);
}

/*events*/ {
	var scrWidth = 1920/window_get_width()
	var scrHeight = 1080/window_get_height()
	display_set_gui_size(window_get_width()*scrWidth, window_get_height()*scrHeight)
}



















































