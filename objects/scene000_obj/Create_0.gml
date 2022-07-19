event_inherited();
main_substring = string_delete(object_get_name(object_index), string_length(object_get_name(object_index))-2, 4)

/*model:*/ {
	mesh = new BBMOD_Model(main_substring+"mesh_no_trees.bbmod");

	directionBody = direction;
	size = 0.5;
}

/*load textures*/ {
	base000 = sprite_add(main_substring+"mat000_base.png",
		0,0,0,0,0)
	base001 = sprite_add(main_substring+"mat001_base.png",
		0,0,0,0,0)
	base002 = sprite_add(main_substring+"mat002_base.png",
		0,0,0,0,0)
	base003 = sprite_add(main_substring+"mat003_base.png",
		0,0,0,0,0)
	normal000 = sprite_add(main_substring+"mat000_normal.png",
		0,0,0,0,0)
	normal001 = sprite_add(main_substring+"mat001_normal.png",
		0,0,0,0,0)
	normal002 = sprite_add(main_substring+"mat002_normal.png",
		0,0,0,0,0)
	specular000 = sprite_add(main_substring+"mat000_specular.png",
		0,0,0,0,0)
	specular001 = sprite_add(main_substring+"mat001_specular.png",
		0,0,0,0,0)
	specular002 = sprite_add(main_substring+"mat002_specular.png",
		0,0,0,0,0)
}

/*material:*/ {
	material000 = BBMOD_MATERIAL_DEFAULT.clone();
	material000.BaseOpacity = sprite_get_texture(base000, 0);
	material000.NormalSmoothness = sprite_get_texture(normal000, 0);
	material000.SpecularColor = sprite_get_texture(specular000, 0);
	material001 = BBMOD_MATERIAL_DEFAULT.clone();
	material001.BaseOpacity = sprite_get_texture(base001, 0);;
	material001.NormalSmoothness = sprite_get_texture(normal001, 0);
	material002 = BBMOD_MATERIAL_DEFAULT.clone();
	material002.BaseOpacity = sprite_get_texture(base002, 0);
	material003 = BBMOD_MATERIAL_DEFAULT.clone();
	material003.BaseOpacity = sprite_get_texture(base003, 0);
	mesh.Materials[@ 0] = material000;
	mesh.Materials[@ 1] = material001;
	mesh.Materials[@ 2] = material002;
	mesh.Materials[@ 3] = material003;
	mesh.Materials[@ 2].set_shader(BBMOD_ERenderPass.Shadows, BBMOD_SHADER_DEPTH);
}

/*generate model*/ {
    matrixBody = matrix_build_identity();
	mesh.freeze();
}

/*events*/ {
}


















































