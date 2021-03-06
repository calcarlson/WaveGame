///liquid_point_y_precise(id, x)
/*
    Returns the exact y of water at x
    
    ARGUMENTS
        id - real - the liquid id
        x - real - the x in the room (not relative) to check the y position
    
    RETURNS
        y - real - the y in the room of the water at x, precisely
*/

    //find the nearest nodes to the x
    var sx, ny1, ny2;
    sx = clamp((argument1-argument0.x)/argument0.liquidnodewidth, 0 , argument0.liquidnodes-1);
    ny1 = argument0.liquidarray[floor(sx), 1]+argument0.liquidarray[floor(sx), 3]+(argument0.liquidbobamount*dsin((floor(sx)*argument0.liquidbobscale)-(current_time*argument0.liquidbobspeed)));//+argument0.liquidarray[floor(sx), 3];
    ny2 = argument0.liquidarray[ceil(sx), 1]+argument0.liquidarray[ceil(sx), 3]+(argument0.liquidbobamount*dsin((ceil(sx)*argument0.liquidbobscale)-(current_time*argument0.liquidbobspeed)));//+argument0.liquidarray[ceil(sx), 3];

    //interpolate
    return lerp(ny1, ny2, frac(sx))
