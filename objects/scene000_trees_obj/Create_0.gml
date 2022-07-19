event_inherited();
main_substring = "scene000_"

/*model:*/ {
	mesh = new BBMOD_Model(main_substring+"mesh_with_trees.bbmod");	
	
	/*mesh = resource_manager_obj.resourceManager.load(
		main_substring+"mesh_with_trees.bbmod",
		undefined,
		method(self, function (_err, _model) {
			if (!_err)
			{
				show_debug_message("LOADED")
				_model.freeze();
			}
	}));*/
	directionBody = direction;
	size = 0.18
}

/*load textures*/ {
	base = sprite_add(main_substring+"mat002_base.png",
		0,0,0,0,0)
	normal = sprite_add(main_substring+"mat002_normal.png",
		0,0,0,0,0)
}

/*material:*/ {
	
	material = BBMOD_MATERIAL_DEFAULT.clone()
		.set_shader(BBMOD_ERenderPass.Shadows, BBMOD_SHADER_DEPTH)
	material.BaseOpacity = sprite_get_texture(base, 0);
	material.NormalSmoothness = sprite_get_texture(normal, 0);

}

/*generate model*/ {
	mesh.freeze()
    matrixBody = matrix_build_identity();
}

/*events*/ {
}


















































