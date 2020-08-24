/// @function pal_swap_get_pal_count(pal_spr);
/// @param Pal_Sprite

function pal_swap_get_pal_count(pal_spr) {
	//returns the number of palettes for the given sprite.
	//Useful for clamping palette selection.
	return(sprite_get_width(pal_spr));
}