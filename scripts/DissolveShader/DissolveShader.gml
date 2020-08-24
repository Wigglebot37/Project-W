/// @function DissolveShader(_spr,_frame,_x,_y,_remain);
/// @param {index} Sprite Sprite index
/// @param {real} Subimage Image index
/// @param x X value
/// @param y Y value
/// @param {real} Remains From 0 (fully transparent) to 1 (fully revealed)
/// @description Utilizes the dissolve shader.

function DissolveShader(_spr,_frame,_x,_y,_remain) {
	//Call DissolveSettings at least once in the object before using this.

	//If you have a fixed sprite you could possibly move this to DissolveSettings for a minor speed boost
	var _DissolveSprUvs = sprite_get_uvs(_spr,_frame);

	shader_set(_Dissolve_Shader);
	shader_set_uniform_f(_u_Dissolve,_remain);
	shader_set_uniform_f(_u_DissolveEdge,_DissolveEdge);
	shader_set_uniform_f(_u_DissolveUV,_DissolveTexUvs[0],_DissolveTexUvs[1]);
	shader_set_uniform_f(_u_DefaultUV,_DissolveSprUvs[0],_DissolveSprUvs[1]);
	shader_set_uniform_f(_u_DissolveC1,_DissolveC1[0],_DissolveC1[1],_DissolveC1[2]);
	shader_set_uniform_f(_u_DissolveC2,_DissolveC2[0],_DissolveC2[1],_DissolveC2[2]);
	texture_set_stage(_u_DissolveTex,_DissolveTex);

	draw_sprite(_spr,_frame,_x,_y);
	//If you need to scale & rotate etc you can use draw_sprite_ext() above instead.
	//You must then add each argument to the script as necessary or insert a default value.
	//Example:
	//draw_sprite_ext(_spr,_frame,_x,_y(arg 3,skip 4),argument5,argument6,argument7,argument8,argument9);

	shader_reset();
}