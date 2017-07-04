state = "idle";


gridX = 0;
gridY = 0;

name = "Error!";

// character statistics
move = 5;
actions = 2;
initiative = 0;
initRoll = 0;


// variables related to pathing-----------------------------
movementPath = path_add();
path_set_kind(movementPath, 2);
path_set_closed(movementPath, false);

moveSpeed = 8;