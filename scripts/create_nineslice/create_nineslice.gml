///@function create_nineslice(sprite,subimg,x1,y1,x2,y2);
///@param {index} Sprite
///@param {real} Subimage
///@param x1
///@param y1
///@param x2
///@param y2

function create_nineslice(sprite,subimg,x1,y1,x2,y2) {
	cam=obj_camera;

	var slice_width = sprite_get_width(sprite)/3;
	var slice_height = sprite_get_height(sprite)/3;

	if (sprite_get_width(sprite)%3 != 0 || sprite_get_height(sprite)%3 != 0) {
		show_debug_message("WARNING: Sprite is not a multiple of 3.");
	}

	var width = abs(x2-x1);
	var height = abs(y2-y1);
	var sc=scalar;

	// Top
	draw_sprite_part_ext(sprite, subimg, 0, 0, slice_width, slice_height, x1, y1, 1*sc, 1*sc, c_white, 1); // Left
	draw_sprite_part_ext(sprite, subimg, slice_width, 0, slice_width, slice_height, x1+(slice_width*sc), y1, (width-slice_width*2*sc)/slice_width, 1*sc, c_white, 1); // Middle
	draw_sprite_part_ext(sprite, subimg, slice_width*2, 0, slice_width, slice_height, x2-slice_width*sc, y1, 1*sc, 1*sc, c_white, 1); // Right

	// Middle
	draw_sprite_part_ext(sprite, subimg, 0, slice_height, slice_width, slice_height, x1, y1+slice_height*sc, 1*sc, (height-slice_height*2*sc)/slice_height, c_white, 1); // Left
	draw_sprite_part_ext(sprite, subimg, slice_width, slice_height, slice_width, slice_height, x1+slice_width*sc, y1+slice_height*sc, (width-slice_width*2*sc)/slice_width, (height-slice_height*2*sc)/slice_height, c_white, 1); // Middle
	draw_sprite_part_ext(sprite, subimg, slice_width*2, slice_height, slice_width, slice_height, x2-slice_width*sc, y1+slice_height*sc, 1*sc, (height-slice_height*2*sc)/slice_height, c_white, 1); // Right

	// Bottom
	draw_sprite_part_ext(sprite, subimg, 0, slice_height*2, slice_width, slice_height*2, x1, y2-slice_height*sc, 1*sc, 1*sc, c_white, 1); // Left
	draw_sprite_part_ext(sprite, subimg, slice_width, slice_height*2, slice_width, slice_height, x1+slice_width*sc, y2-slice_height*sc, (width-slice_width*2*sc)/slice_width, 1*sc, c_white, 1); // Middle
	draw_sprite_part_ext(sprite, subimg, slice_width*2, slice_height*2, slice_width, slice_height, x2-slice_width*sc, y2-slice_height*sc, 1*sc, 1*sc, c_white, 1); // Right
}