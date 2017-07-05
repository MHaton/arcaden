if (flash){
	colour = choose(c_white, c_yellow, c_orange);
}

if (shake > 0){
	draw_sprite_ext(sprite_index, -1, x + irandom_range(-shakeMag, shakeMag), y + irandom_range(-shakeMag, shakeMag), 1, 1, 0, c_white, 1);
}else{
draw_sprite_ext(sprite_index, -1, x, y, 1, 1, 0, colour, 1);
}