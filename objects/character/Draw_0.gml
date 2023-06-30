
//draw player

if split == false {
	//if sprite sheet is not split
	var wid = 8; //number of cells across in a sheet
	var cell_wid = 64; //width of cells in pixles
	var hei = 8; //numnber of cells vert in a sheet
	var cell_hei = 64; //height of cell in pixles
	var xx = i_index mod wid; //find which column in sheet the part is in
	var yy = floor(i_index/hei); //find which row in the sheetthe part is in
	var y_off = 24; //an offset to visually move the character to the x,y coord of the object
	//base layer
	draw_sprite_part(under_layer,0,xx*cell_wid,yy*cell_hei,cell_wid,cell_hei,x-cell_wid/2,y-cell_hei+y_off);
	//clothes
	for (var i=0; i<4; i++) {
		if outfit.layers_visible[i] == true
			draw_sprite_part(outfit.layers[i],0,xx*cell_wid,yy*cell_hei,cell_wid,cell_hei,x-cell_wid/2,y-cell_hei+y_off)
	}
} else {
	//if the sprite sheet was split into indervidual frames
	//base layer
	draw_sprite_ext(under_layer,i_index,x,y-y_offset,image_xscale,image_yscale,0,c_white,1);
	//clothes
	for (var i=0; i<=dl.weapons; i++) {
		if outfit.layers_visible[i] == true
			draw_sprite_ext(outfit.layers[i],i_index,x,y-y_offset,image_xscale,image_yscale,0,c_white,1);
	}
}
//debug values
draw_text(20,5,state.state_name);
draw_text(20,20,"Image Index: "+string(i_index));
draw_healthbar(20,40,120,50,delta/10,c_black,c_green,c_red,0,0,1);
draw_text(20,60,"Subframe count: "+string(ani));
draw_text(20,80,state.frame_rate);
draw_text(20,100,state.frames);
draw_text(20,120,state.first_frame);
draw_text(20,140,image_index);
draw_circle(x+moveX,y+moveY,3,false); //to show where the character object actually thinks it is, in case the offsets are wrong

