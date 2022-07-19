if(enabled) {
	var _step = 2.5;
	matrix_set(matrix_world, matrix_build(x, y, z, -180, 0, +directionBody+90, size, size, size));
	mesh_sword.render();
	matrix_set(matrix_world, matrix_build(x, y, 1, -180, 0, +directionBody+90, size_aura, size_aura, size_aura));
	mesh_aura.render();
}

