/// @function create_menu_page(_array1,_array2);
/// @param Array1 ["Name1",sprite1,type1,entries1...]
/// @param Array2 ["Name2",sprite2,type2,entries2...]
/// @description Creates a menu page.

function create_menu_page() {
	var arg,i=0;
	repeat(argument_count) {
		arg[i]=argument[i];
		i++;
	}
	
	var ds_grid_id=ds_grid_create(7,argument_count);
	i=0; repeat(argument_count) {
		var array=arg[i];
		var array_len=array_length(array);
	
		var xx=0; repeat(array_len) {
			// # accesses that coordinate of the grid
			ds_grid_id[# xx, i]=array[xx];
			xx++;
		}
		i++;
	}
	return ds_grid_id;
}
