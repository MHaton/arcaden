//argument0 - The actor we're creating the path for
//argument1 - the destination we're going to

selectedActor = argument0;
current = argument1;

//convert path to queue
path = ds_priority_create();
ds_priority_add(path, current, current.G);

// step through each node, parent to parent until done
while (current.parent != noone) {
    //add parent not to queue, priority equal to parent's G score
    ds_priority_add(path, current.parent, current.parent.G);
    //set current equal to current's parent, ready to go again
    current = current.parent;
}
do {
    //delete lowest priority node (lowest G, closest), store ID
    current = ds_priority_delete_min(path);
    //add current node's sprite coordinates to selectedActor's path
    //TODO: maybe make this correspond to the cost of terrain
    path_add_point(selectedActor.movementPath, current.x, current.y, 100);
}
until(ds_priority_empty(path));
//clean up, clean up, everybody everywhere
ds_priority_destroy(path);