//check if it's hit
if (attackStatus != "miss"){
	for (ii = 0; ii < 6; ii += 1){
		with (instance_create_layer(attackTarget.x + 16, attackTarget.y, "effects", obj_bam)){
			direction = irandom(360);
			speed = irandom_range(2,4);
			scale = choose(2,3);
			
			image_speed = 0.5;
			
			if other.attackStatus = "crit"{
				colour = c_yellow;			
			}
		}
	}
	with (instance_create_layer(attackTarget.x + 16, attackTarget.y - 38, "text", obj_damageText)){
		text = "-" + string(other.damage);
		
		ground = y;
		
		if (other.attackStatus == "crit"){
			font = fnt_crit;
			colour = c_yellow;
		}
	}
	if (attackStatus = "crit"){
		attackTarget.shake = 8;
		attackTarget.shakeMag = 8;
	}else{
		attackTarget.shake = 4;
		attackTarget.shakeMag = 4;
	}
}else{
//it missed
	with (instance_create_layer(attackTarget.x + 16, attackTarget.y - 38 , "text", obj_damageText)){
		text = "Miss!";
		ground = y;
	}
}