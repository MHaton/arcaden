// argument0 - node ID to colour
// argument1 - selected actor's move stat
// argument2 - selected actor's actions

var node, move, actions

node = argument0;
move = argument1;
actions = argument2;

// change this later so it looks nicer
if (actions > 1) {
	if (node.G > move){
		node.colour = c_yellow;
	}else{
		node.colour = c_aqua;
	}
}else{
	node.colour = c_yellow;
}