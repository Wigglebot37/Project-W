/// @function DissolveSettings(_sprmask,_maskfr,_incol,_outcol,_edgethick);
/// @param {index} SpriteMask black and white dissolve pattern. Dimensions must match the sprite to be dissolved!
/// @param {real} MaskFrame Mask sub-image index
/// @param {color} Innercol eg: c_red, or make_colour_rgb())
/// @param {color} Outercol eg: c_red, or make_colour_rgb())
/// @param {real} EdgeThickness from 0 (no colour edge) to 0.99 (full sprite)
/// @description Sets up dissolve shader.

function DissolveSettings(_sprmask,_maskfr,_incol,_outcol,_edgethick) {
	//Call in the create event of an object, or when you need to change the colours, mask or thickness of the dissolve

	_Dissolve_Shader = shDissolve; //Incase you want to change the name of the shader resource
	_u_DissolveTex = shader_get_sampler_index(_Dissolve_Shader,"DissolveTex");
	_u_Dissolve = shader_get_uniform(_Dissolve_Shader,"Dissolve");
	_u_DissolveUV = shader_get_uniform(_Dissolve_Shader,"DissolveUV"); 
	_u_DefaultUV = shader_get_uniform(_Dissolve_Shader,"DefaultUV"); 
	_u_DissolveEdge = shader_get_uniform(_Dissolve_Shader,"Edge");
	_u_DissolveC1 = shader_get_uniform(_Dissolve_Shader,"C1");
	_u_DissolveC2 = shader_get_uniform(_Dissolve_Shader,"C2");

	_DissolveTex = sprite_get_texture(_sprmask,_maskfr);
	_DissolveTexUvs = sprite_get_uvs(_sprmask,_maskfr);

	_DissolveC1 = [colour_get_red(_incol)/255,colour_get_green(_incol)/255,colour_get_blue(_incol)/255];
	_DissolveC2 = [colour_get_red(_outcol)/255,colour_get_green(_outcol)/255,colour_get_blue(_outcol)/255];
	_DissolveEdge = _edgethick;
}