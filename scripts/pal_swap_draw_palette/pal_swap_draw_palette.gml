/// @function pal_swap_draw_palette(pal_spr,pal_ind,xx,yy);
/// @param Palette_Sprite
/// @param Pal_Index
/// @param x
/// @param y

function pal_swap_draw_palette(pal_spr,pal_ind,xx,yy) {
	//Draws only the specified palette from the given palette sprite.
	draw_sprite_part(pal_spr,0,pal_ind,0,1,sprite_get_height(pal_spr),xx,yy);
}