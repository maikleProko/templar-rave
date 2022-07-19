event_inherited();
main_substring = string_delete(object_get_name(object_index), string_length(object_get_name(object_index))-2, 4)

/*model:*/ {
    _objImporter = new BBMOD_OBJImporter();
    _objImporter.FlipUVVertically = true;
    model = _objImporter.import("plane.obj");
    model.freeze();
	directionBody = direction;
	size = 16
}

/*load textures*/ {
	base = sprite_add("scene000_water_base.png",
		0,0,0,0,0) 
	normal = sprite_add("scene000_water_normal.png",
		0,0,0,0,0) 
	specular = sprite_add("scene000_water_specular.png",
		0,0,0,0,0)
}

/*material:*/ {
	material = BBMOD_MATERIAL_DEFAULT.clone()
		.set_specular_color(BBMOD_C_WHITE);
	material.BaseOpacity = sprite_get_texture(base, 0)
	material.NormalSmoothness = sprite_get_texture(normal, 0);
    material.Repeat = true;
    material.TextureScale = material.TextureScale.Scale(5.0);
	material.Culling = cull_noculling
    model.Materials[0] = material;
    _objImporter.destroy();
	
}

/*generate model*/ {
        camera_obj.renderer.add({
	    render: method(self, function () {
			var _scale = max(1920, 1080)*8/7;
		    matrix_set(matrix_world, matrix_build( x-_scale/4, y-_scale/4, -77.04, 0, 0, 0, _scale/2, _scale/2, 500));
		     model.render();
	    })
    });
}

/*events*/ {
}


















































